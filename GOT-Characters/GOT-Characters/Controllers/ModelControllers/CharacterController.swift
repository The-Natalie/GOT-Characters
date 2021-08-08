//
//  CharacterController.swift
//  GOT-Characters
//
//  Created by Natalie Hall on 8/4/21.
//

import Foundation
import UIKit.UIImage

class CharacterController {
    
    // https://api.got.show/api/show/characters
    static let baseURL = URL(string: "https://api.got.show/api/show/characters")
    
    static func fetchCharacter(completion: @escaping (Result<[Character], CharacterError>) -> Void) {
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        print(baseURL)
        
        URLSession.shared.dataTask(with: baseURL) { data, response, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("ERROR!!! STATUS CODE: \(response.statusCode)")
                }
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let character = try JSONDecoder().decode([Character].self, from: data)
                return completion(.success(character))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for character: Character, completion: @escaping (Result<UIImage, CharacterError>) -> Void) {
        guard let url = character.image else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("ERROR!!! STATUS CODE: \(response.statusCode)")
                }
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
            return completion(.success(image))
        }.resume()
    }
    
} // End of Class
