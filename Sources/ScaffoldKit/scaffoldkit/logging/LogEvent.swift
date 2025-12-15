//
//  LogEvent.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/15/25.
//

protocol LogEvent {
    
    var content: String { get }
    var attributes: [String : Any] { get }
    
}
