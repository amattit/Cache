//
//  File.swift
//  
//
//  Created by Михаил Серегин on 06.08.2021.
//

import Foundation

internal extension Cache {
    final class KeyTracker: NSObject, NSCacheDelegate {
        var keys = Set<Key>()
        
        func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
            guard let entry = obj as? Entry else {
                return
            }
            
            keys.remove(entry.key)
        }
    }
}
