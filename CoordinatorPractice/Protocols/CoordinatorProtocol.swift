//
//  CoordinatorProtocol.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] { get set }
    
    // MARK: - Functions
    func start()
    @discardableResult func add(childCoordinator: Coordinator) -> Coordinator
}

extension Coordinator {
    
    // MARK: - Functions
    @discardableResult
    func add(childCoordinator: Coordinator) -> Coordinator {
        childCoordinators.append(childCoordinator)
        return childCoordinator
    }
}
