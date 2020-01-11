//
//  Environment.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 1/11/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct Environment {
    private static let environmentFile = Bundle.main.path(forResource: "Environment", ofType: "plist")

    static var baseUrl: String = {
        guard let environmentFile = environmentFile,
            let environmentDictionary = NSDictionary(contentsOfFile: environmentFile),
            let url = environmentDictionary["BASE_URL"] as? String
            else {
                fatalError("BASE_URL not found in Environment.plist")
        }
        return url
    }()
}
