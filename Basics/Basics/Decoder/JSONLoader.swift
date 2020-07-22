//
//  JSONLoader.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/21/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation

class JSONLoader {
    // returns a JSON data object. Returns null json if there's a problem
    class func getJSONData(fromFile fileName: String) -> Data {
        let bundle = Bundle(for:self)
        
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path))
            } catch {
                print("Error parsing json file")
            }
        }
        
        return Data()
    }
    
    class func unbox(for fileName: String) -> String {
        let data = JSONLoader.getJSONData(fromFile: fileName)
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            let jsonData =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            guard let string = String(data: jsonData, encoding: String.Encoding.utf8) else {
                return ""
            }
            return string
        } catch {
            print(error)
        }
        return ""
    }
    
    class func decode(for json: String) -> AssetData? {
        let jsonData = json.data(using: .utf8)!
        do {
            let jsonDecoder = JSONDecoder()
            let viewData = try jsonDecoder.decode(AssetData.self, from: jsonData)
            return viewData
        } catch {
            print("Unexpected error: \(error).")
        }
        return nil
    }
}
