//
//  Config.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 29/04/2021.
//

import Foundation

class Config {
    static func getGoogleApiKey() -> [String]? {
        guard let keys = Utils.getPlist(withName: "keys") else {
            return nil;
        }
        
        print(keys)
        return keys
    }
}
