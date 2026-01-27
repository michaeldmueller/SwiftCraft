//
//  LoggingProvider.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/14/25.
//

protocol LoggingProvider {
    
    func debug(
        message: Log,
        sender: Any
    )
    
    func info(
        message: Log,
        sender: Any
    )
    
    func notice(
        message: Log,
        sender: Any
    )
    
    func warn(
        message: Log,
        sender: Any
    )
    
    func error(
        message: Log,
        sender: Any
    )
    
}
