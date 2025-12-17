//
//  ScaffoldKitError.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/16/25.
//

import Foundation

public enum ScaffoldKitError: LocalizedError {
    
    case invalidUrl(urlString: String)
    case failedJsonDeserialization(
        url: String,
        debugDescription: String,
        response: [String : Any]
    )
    case invalidHttpResponse(urlString: String)
    case invalidResponseCode(
        statusCode: Int,
        response: [String : Any],
        url: String
    )
    
}
