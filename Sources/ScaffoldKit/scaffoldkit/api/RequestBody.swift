//
//  RequestBody.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/16/25.
//

import Foundation

public enum RequestBody {
    case json(Decodable)
    case file(
        data: Data,
        fileExtension: String
    )
    case none
}
