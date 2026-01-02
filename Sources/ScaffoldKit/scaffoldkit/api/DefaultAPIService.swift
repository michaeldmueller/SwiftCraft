//
//  DefaultAPIService.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/16/25.
//

import Foundation

public final class DefaultAPIService: APIService {
    
    // TODO: Figure out how to make this open to change
    private let defaultTimeout = 60.0
    
    public func request<T>(
        path: APIPath,
        methodType: MethodType,
        requestBody: RequestBody,
        pathParameters: [String]? = nil,
        queryParameters: [String : String]? = nil
    ) async throws -> T where T : Decodable {
        return try await makeAPICall(
            url: path.asURL(
                pathParameters: pathParameters,
                queryParameters: queryParameters
            ),
            methodType: methodType,
            requestBody: requestBody
        )
    }
    
    private func makeAPICall<T: Decodable>(
        url: URL,
        methodType: MethodType,
        requestBody: RequestBody = .none
    ) async throws -> T {
        let data = try await performRequest(
            url: url,
            methodType: methodType,
            requestBody: requestBody
        )
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context),
                let DecodingError.keyNotFound(_, context),
                let DecodingError.typeMismatch(_, context),
                let DecodingError.valueNotFound(_, context) {
            // Provide specific information for JSON deserialization errors
            let response = deserializeAndPrintJsonData(jsonData: data)
            throw ScaffoldKitError.failedJsonDeserialization(
                url: url.absoluteString,
                debugDescription: "\(context.debugDescription), \(context.codingPath)",
                response: response ?? [:]
                
            )
        } catch {
            throw error
        }
    }
    
    private func performRequest(
        url: URL,
        methodType: MethodType,
        requestBody: RequestBody
    ) async throws -> Data {
        print("\(methodType.rawValue): \(url.absoluteString)")
        
        let request = buildRequest(
            url: url,
            method: methodType,
            requestBody: requestBody
        )
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw ScaffoldKitError.invalidHttpResponse(
                urlString: url.absoluteString
            )
        }

        guard response.statusCode.isSuccessCode() else {
            let json = (try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]) ?? [:]
            throw ScaffoldKitError.invalidResponseCode(
                statusCode: response.statusCode,
                response: json,
                url: url.absoluteString
            )
        }
        
        return data
    }
    
    private func buildRequest(
        url: URL,
        method: MethodType,
        requestBody: RequestBody
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = defaultTimeout
        request.httpMethod = method.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        switch (requestBody) {
            case .file(let data, let fileExtension):
                let boundary = generateBoundary()
                let httpBody = NSMutableData()
                httpBody.append(
                    convertFileData(
                        fieldName: "image",
                        fileName: "imagename.\(fileExtension)",
                        mimeType: "image/\(fileExtension)",
                        fileData: data,
                        using: boundary
                    )
                )
                httpBody.appendString("--\(boundary)--")
                request.addValue(
                    "multipart/form-data; boundary=\(boundary)",
                    forHTTPHeaderField: "Content-Type"
                )
                request.addValue(
                    String(httpBody.length),
                    forHTTPHeaderField: "Content-Length"
                )
                request.httpBody = httpBody as Data
            case .json(let json):
                let jsonData = try? JSONSerialization.data(
                    withJSONObject: json,
                    options: .prettyPrinted
                )
                request.httpBody = jsonData
                request.addValue(
                    "application/json",
                    forHTTPHeaderField: "Content-Type"
                )
            case .none:
                request.addValue(
                    "application/json",
                    forHTTPHeaderField: "Content-Type"
                )
            }
                
        return request
    }
    
    private func generateBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    private func convertFileData(
        fieldName: String,
        fileName: String,
        mimeType: String,
        fileData: Data,
        using boundary: String
    ) -> Data {
        let data = NSMutableData()
        
        data.appendString("--\(boundary)\r\n")
        data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
        data.appendString("Content-Type: \(mimeType)\r\n\r\n")
        data.append(fileData)
        data.appendString("\r\n")

        return data as Data
    }
    
    private func deserializeAndPrintJsonData(jsonData: Data) -> [String : Any]? {
        if let json = try? JSONSerialization.jsonObject(
            with: jsonData,
            options: []
        ) as? [String : Any] {
            print("Failed JSON response:\n\(json)")
            return json
        } else {
            return nil
        }
    }
    
}


private extension NSMutableData {
    
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
    
}

private extension Int {
    
    func isSuccessCode() -> Bool {
        return self >= 200 && self <= 299
    }
    
}

