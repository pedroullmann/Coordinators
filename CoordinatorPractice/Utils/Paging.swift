//
//  Paging.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 1/11/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class Paging {
    var threshold: Int
    var offset: Int
    var limit: Int
    
    init(limit: Int) {
        self.threshold = 5
        self.offset = 0
        self.limit = limit
    }
}
