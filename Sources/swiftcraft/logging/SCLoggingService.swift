//
//  SCLoggingService.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 9/25/25.
//

import Foundation

class SCLoggingService {
    
    public static let shared = SCLoggingService()
    
    private var providers = [SCLoggingProvider]()
    
    private init() {}
    
    public func registerLoggingProvider(provider: SCLoggingProvider) {
        self.providers.append(provider)
    }
    
    public func registerLoggingProviders(providers: [SCLoggingProvider]) {
        self.providers += providers
    }
    
    func debug(
        message: SCLog,
        sender: Any
    ) {
        providers.forEach {
            $0.debug(message: message, sender: sender)
        }
    }
    
    func info(
        message: SCLog,
        sender: Any
    ) {
        providers.forEach {
            $0.info(message: message, sender: sender)
        }
    }
    
    func notice(
        message: SCLog,
        sender: Any
    ) {
        providers.forEach {
            $0.notice(message: message, sender: sender)
        }
    }
    
    func warn(
        message: SCLog,
        sender: Any
    ) {
        providers.forEach {
            $0.warn(message: message, sender: sender)
        }
    }
    
    func error(
        message: SCLog,
        sender: Any
    ) {
        providers.forEach {
            $0.error(message: message, sender: sender)
        }
    }        
    
}
