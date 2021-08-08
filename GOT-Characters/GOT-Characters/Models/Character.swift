//
//  Character.swift
//  GOT-Characters
//
//  Created by Natalie Hall on 8/4/21.
//

import Foundation

struct Character: Codable {
    let origin: [String]?
    let name: String
    let image: URL?
    let house: String?
    let actor: String?
    
    let age: Age?
    struct Age: Codable {
        let age: Int?
    }
}
