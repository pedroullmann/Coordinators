//
//  PokemonResponse.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import Foundation

struct PokemonResponse: Decodable {
    
    // MARK: - Properties
    let results: [Pokemon]
}
