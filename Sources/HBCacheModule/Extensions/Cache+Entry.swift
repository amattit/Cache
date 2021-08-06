//
//  File.swift
//  
//
//  Created by Михаил Серегин on 06.08.2021.
//

import Foundation

internal extension Cache {
    final class Entry {
        let key: Key
        let value: Value
        let expirationDate: Date
        
        init(
            key: Key,
            value: Value,
            expirationDate: Date
        ) {
            self.key = key
            self.value = value
            self.expirationDate = expirationDate
        }
    }
}

extension Cache.Entry: Codable where Key: Codable, Value: Codable {}
