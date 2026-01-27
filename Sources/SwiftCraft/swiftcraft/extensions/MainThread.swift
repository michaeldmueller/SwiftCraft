//
//  MainThread.swift
//  ScaffoldKit
//
//  Created by Michael Mueller on 1/2/26.
//

import Foundation

enum MainThread {
    
    static func run(_ block: @escaping () -> Void) {
        if (Thread.isMainThread) {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
    
}
