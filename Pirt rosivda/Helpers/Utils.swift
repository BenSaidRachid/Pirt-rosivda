//
//  Utils.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 29/04/2021.
//

import Foundation

class Utils {
    static func getPlist(withName name: String) -> [String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }

        return nil
    }
}
