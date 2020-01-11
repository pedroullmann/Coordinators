//
//  HomeService.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol: AnyObject {
    func getPokemons(offset: Int, limit: Int, completion: @escaping(Result<PokemonResponse>) -> Void)
}

class HomeService: HomeServiceProtocol {
    func getPokemons(offset: Int, limit: Int, completion: @escaping(Result<PokemonResponse>) -> Void) {
        let parameters = [
            "offset": offset,
            "limit": limit
        ]
        
        request("\(Environment.baseUrl)pokemon",
                method: .get,
                parameters: parameters,
                encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let pokemonResponse = try decoder.decode(PokemonResponse.self, from: response.data!)
                    completion(Result.success(pokemonResponse))
                } catch let error {
                    completion(Result.failure(error))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
