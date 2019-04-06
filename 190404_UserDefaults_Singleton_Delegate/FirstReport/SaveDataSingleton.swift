//
//  SaveDataSingleton.swift
//  FirstReport
//
//  Created by Fury on 04/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

class SaveDataSingleton {
    static let shared = SaveDataSingleton()
    private init() {}
    
    var str = ""
}
