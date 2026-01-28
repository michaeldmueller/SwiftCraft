//
//  SCLoggingProvider.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/14/25.
//

protocol SCLoggingProvider {
    
    func debug(
        message: SCLog,
        sender: Any
    )
    
    func info(
        message: SCLog,
        sender: Any
    )
    
    func notice(
        message: SCLog,
        sender: Any
    )
    
    func warn(
        message: SCLog,
        sender: Any
    )
    
    func error(
        message: SCLog,
        sender: Any
    )
    
}
