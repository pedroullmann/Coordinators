//
//  RequestResult.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
