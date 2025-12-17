//
//  APIService.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/16/25.
//

public protocol APIService {
    
    func request<T: Decodable>(
        path: APIPath,
        methodType: MethodType,
        requestBody: RequestBody,
        pathParameters: [String]?,
        queryParameters: [String : String]?
    ) async throws -> T
    
}
