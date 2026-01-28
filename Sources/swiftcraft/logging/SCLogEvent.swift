//
//  SCLogEvent.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 12/15/25.
//

protocol SCLogEvent {
    
    var content: String { get }
    var attributes: [String : Any] { get }
    
}
