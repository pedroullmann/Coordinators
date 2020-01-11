//
//  HomeViewModel.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import Foundation

protocol HomeNavigationProtocol: AnyObject {
    func didSelectPokemon(_ pokemon: Pokemon)
}

protocol HomeViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    var updateHandler: () -> Void { get set }
    
    // MARK: - Functions
    func fetchPokemons(offset: Int, limit: Int)
    func didTapPokemon(at indexPath: IndexPath)
    func pokemonsCount() -> Int
    func getObject(at row: Int) -> Pokemon?
}

class HomeViewModel {
    
    // MARK: - Properties
    var updateHandler: () -> Void = {}
    private weak var navigationDelegate: HomeNavigationProtocol?
    private var homeService: HomeService
    private var pokemons: [Pokemon] = []
    
    // MARK: - Initializer
    init(homeService: HomeService = HomeService(),
         navigationDelegate: HomeNavigationProtocol? = nil) {
        
        self.homeService = homeService
        self.navigationDelegate = navigationDelegate
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Functions
    func fetchPokemons(offset: Int, limit: Int) {
        homeService.getPokemons(offset: offset, limit: limit) { [weak self] result in
            switch result {
            case .success(let response):
                if offset == 0 {
                    self?.pokemons = response.results
                } else {
                    self?.pokemons.append(contentsOf: response.results)
                }
                
                self?.updateHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didTapPokemon(at indexPath: IndexPath) {
        guard pokemons.indices.contains(indexPath.row) else { return }
        let pokemon = pokemons[indexPath.row]
        
        navigationDelegate?.didSelectPokemon(pokemon)
    }

    func pokemonsCount() -> Int {
        return pokemons.count
    }
    
    func getObject(at row: Int) -> Pokemon? {
        guard pokemons.indices.contains(row) else {
            return nil
        }
        return pokemons[row]
    }
}
