//
//  ViewController.swift
//  SecondProject
//
//  Created by Fury on 02/04/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var dogCnt = 0
    var catCnt = 0
    var birdCnt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // 세그웨이를 만들어 실행할 것인가 말것인가를 판단! (화면을 띄울 것인지 말 것인지)
        
        switch identifier {
        case "dogIdentifier":
            if dogCnt >= 8 { return false } else { return true }
        case "catIdentifier":
            if catCnt >= 10 { return false } else { return true }
        case "birdIdentifier":
            if birdCnt >= 15 { return false } else { return true }
        default:
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // 세그웨이를 실행하기 직전에 호출되는 콜백 메소드
        guard let dest = segue.destination as? SecondViewController else {
            return
        }
        
        switch segue.identifier {
        case "dogIdentifier":
            dogCnt += 1
            dest.imageName = "dog"
        case "catIdentifier":
            catCnt += 1
            dest.imageName = "cat"
        case "birdIdentifier":
            birdCnt += 1
            dest.imageName = "bird"
        default:
            break
        }
    }


    @IBAction func unwindToFirstViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}

