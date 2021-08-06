    import XCTest
    @testable import HBCacheModule

    final class HBCacheModuleTests: XCTestCase {
        
        
        
        func testEmptyCache() {
            let cache = Cache<String, [Int]>()
            guard let _ = cache.value(forKey: "empty") else {
                XCTAssert(true)
                return
            }
            XCTFail()
        }
        
        func testAddValue() {
            let cache = Cache<String, [Int]>()
            let array = [1, 2, 3, 4, 5]
            cache["first"] = array
            guard let data = cache["first"] else {
                XCTFail()
                return
            }
            for i in 0 ..< array.count {
                XCTAssert(array[i] == data[i])
            }
        }
        
        func testRemoveValue() {
            let cache = Cache<String, [Int]>()
            let array = [1, 2, 3, 4, 5]
            cache["first"] = array
            cache.removeValue(forKey: "first")
            guard let _ = cache["first"] else {
                XCTAssertTrue(true)
                return
            }
            XCTFail()
        }
        
        func testReplaceData() {
            let cache = Cache<String, [Int]>()
            let array = [1, 2, 3, 4, 5]
            let array2 = array.reversed().compactMap { $0 }
            
            cache["first"] = array
            cache["first"] = array2
            
            guard let data = cache["first"] else {
                XCTFail()
                return
            }
            
            for i in 0 ..< array.count {
                XCTAssert(array2[i] == data[i])
            }
        }
        
        func testReplaceDataByNil() {
            let cache = Cache<String, [Int]>()
            let array = [1, 2, 3, 4, 5]
            
            cache["first"] = array
            cache["first"] = nil
            
            guard let _ = cache["first"] else {
                XCTAssertTrue(true)
                return
            }
            XCTFail()
        }
        
        func testSaveToFile() {
            let cache = Cache<String, [Int]>()
            let array = [1, 2, 3, 4, 5]
            cache["first"] = array
            do {
                try cache.saveToDisk(withName: "first", using: .default)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        func testloadFromFile() {
            let cache = Cache<String, [Int]>()
            let array = [1, 2, 3, 4, 5]
            cache["first"] = array
            do {
                try cache.saveToDisk(withName: "first", using: .default)
                
                let c = try cache.loadFromDisk(withName: "first", using: .default).value(forKey: "first")!
                for i in 0 ..< array.count {
                    XCTAssert(array[i] == c[i])
                }
                
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    }
