//
//  File.swift
//  
//
//  Created by Михаил Серегин on 06.08.2021.
//

import Foundation

extension Cache {
    subscript(key: Key) -> Value? {
        get { return value(forKey: key) }
        set {
            guard let value = newValue else {
                removeValue(forKey: key)
                return
            }
            
            insert(value, for: key)
        }
    }
}
