//
//  RetainSingleton.swift
//  ShoppingItems
//
//  Created by Fury on 16/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation
import UIKit

class RetainSingleton {
    static let shard = RetainSingleton()
    
    private init() {}
    
    var countDic = [0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0,
                    0, 0, 0, 0, 0]
}
