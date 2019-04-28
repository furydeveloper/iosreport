//
//  DataManager.swift
//  DominoPizzaExam
//
//  Created by Fury on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    var dominoPizzaAllData: PizzaData?
    
    var currentCategory: Int?
    var currentProduct: Int?
}
