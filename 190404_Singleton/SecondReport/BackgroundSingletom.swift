//
//  BackgroundSingletom.swift
//  SecondReport
//
//  Created by Fury on 04/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation
import UIKit

class BackgroundSingleton {
    static let color = BackgroundSingleton()
    private init() {}
    
    var red: CGFloat?
    var green: CGFloat?
    var blue: CGFloat?
}
