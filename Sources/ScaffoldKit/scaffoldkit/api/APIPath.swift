//
//  APIPath.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/16/25.
//

import Foundation

public struct APIPath {
    
    public let path: String
    
    public init(path: String) {
        self.path = path
    }
    
    func asURL(
        pathParameters: [String]? = nil,
        queryParameters: [String : String]? = nil
    ) throws -> URL {
        var modifiablePath = path
        if let pathParameters {
            for pathParameter in pathParameters {
                modifiablePath += "/" + pathParameter
            }
        }
        if let queryParameters, !queryParameters.isEmpty {
            modifiablePath += "?"
            var index = 0
            for (key, value) in queryParameters {
                guard let urlEncodedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                    continue
                }
                modifiablePath += key + "=" + urlEncodedValue
                if (index < queryParameters.count - 1) {
                    modifiablePath += "&"
                }
                index += 1
            }
        }
        if let url = URL(string: modifiablePath) {
            return url
        } else {
            throw ScaffoldKitError.invalidUrl(urlString: modifiablePath)
        }
    }
    
}
