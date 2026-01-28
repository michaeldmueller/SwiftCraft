//
//  SCLog.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/15/25.
//

enum SCLog {
    
    case error(error: Error)
    case message(message: String)
    case event(event: SCLogEvent)
    
}
