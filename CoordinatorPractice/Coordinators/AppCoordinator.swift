//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {    
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    private let rootViewController = UINavigationController()
    private let window: UIWindow
    
    // MARK: - Initializer
    init(window: UIWindow) {
        self.window = window
        setupWindow()
    }
    
    // MARK: - Functions
    private func setupWindow() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(presenter: rootViewController)
        add(childCoordinator: homeCoordinator)
        
        homeCoordinator.start()
    }
}
