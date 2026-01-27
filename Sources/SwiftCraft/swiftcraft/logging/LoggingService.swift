//
//  LoggingService.swift
//  UIKitTools
//
//  Created by Michael Mueller on 9/25/25.
//

import Foundation

class LoggingService {
    
    public static let shared = LoggingService()
    
    private var providers = [LoggingProvider]()
    
    private init() {}
    
    public func registerLoggingProvider(provider: LoggingProvider) {
        self.providers.append(provider)
    }
    
    public func registerLoggingProviders(providers: [LoggingProvider]) {
        self.providers += providers
    }
    
    func debug(
        message: Log,
        sender: Any
    ) {
        providers.forEach {
            $0.debug(message: message, sender: sender)
        }
    }
    
    func info(
        message: Log,
        sender: Any
    ) {
        providers.forEach {
            $0.info(message: message, sender: sender)
        }
    }
    
    func notice(
        message: Log,
        sender: Any
    ) {
        providers.forEach {
            $0.notice(message: message, sender: sender)
        }
    }
    
    func warn(
        message: Log,
        sender: Any
    ) {
        providers.forEach {
            $0.warn(message: message, sender: sender)
        }
    }
    
    func error(
        message: Log,
        sender: Any
    ) {
        providers.forEach {
            $0.error(message: message, sender: sender)
        }
    }        
    
}
