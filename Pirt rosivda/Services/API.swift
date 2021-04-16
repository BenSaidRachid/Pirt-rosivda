//
//  API.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 16/04/2021.
//

import Foundation


class API {
    
    static var shared = API()
    
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1"
    private let session = URLSession(configuration: .default)
}
