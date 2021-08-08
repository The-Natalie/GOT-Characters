//
//  CharcterError.swift
//  GOT-Characters
//
//  Created by Natalie Hall on 8/4/21.
//

import Foundation

enum CharacterError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case.invalidURL:
            return "The URL returned from the server is invalid"
        case.thrownError(let error):
            return "Problem with network call -- \(error)"
        case.noData:
            return "No data was returned from the server"
        case.unableToDecode:
            return "Unable to decode data"
        }
    }
}
