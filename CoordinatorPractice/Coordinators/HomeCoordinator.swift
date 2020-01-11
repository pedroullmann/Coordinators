//
//  HomeCoordinator.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    private let presenter: UINavigationController
    
    // MARK: - Initializer
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = HomeViewModel(navigationDelegate: self)
        let homeViewController = HomeTableViewController(viewModel: viewModel)
        
        presenter.pushViewController(homeViewController, animated: true)
    }
}

// MARK: - HomeNavigationProtocol
extension HomeCoordinator: HomeNavigationProtocol {
    func didSelectPokemon(_ pokemon: Pokemon) {
        // TODO: Detail screen
    }
}
