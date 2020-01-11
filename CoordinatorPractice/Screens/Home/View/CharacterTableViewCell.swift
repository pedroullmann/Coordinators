//
//  PokemonTableViewCell.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/24/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let pokemonName = UILabel()
    
    var pokemon: Pokemon! {
        didSet {
            setupCell(pokemon)
        }
    }
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has nosdt been implemented")
    }
    
    // MARK: - Functions
    private func setupComponents() {
        
        // Se desejamos calcular dinamicamente os tamanhos
        // e posições das views, devemos alterar o valor dessa propriedade
        // para false. Por default, toda view criada via código
        // possui esse valor como true. Se criada via Interface Builder
        // o valor default é false.
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicionar na hierarquia da view
        contentView.addSubview(pokemonName)
        
        // Adicionar constraints
        pokemonName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        pokemonName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    func setupCell(_ pokemon: Pokemon) {
        pokemonName.text = pokemon.name
    }
}
