//
//  Config.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 29/04/2021.
//

import Foundation

class Config {
    static func getGoogleApiKey() -> String? {
        guard let key = Utils.getPlist(withName: "keys")?["GOOGLE_API_KEY"] as? String else {
           return nil;
        }
       
        return key
    }
}
