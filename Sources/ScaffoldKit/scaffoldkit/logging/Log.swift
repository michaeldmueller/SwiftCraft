//
//  Log.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/15/25.
//

enum Log {
    
    case error(error: Error)
    case message(message: String)
    case event(event: LogEvent)
    
}
