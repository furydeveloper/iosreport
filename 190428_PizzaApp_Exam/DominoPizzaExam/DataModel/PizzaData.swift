//
//  PizzaData.swift
//  DominoPizzaExam
//
//  Created by Fury on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

class PizzaData {
    var menus: [Category]
    
    init(menus: [Category]) {
        self.menus = menus
    }
}

struct Category {
    var categoryName: String
    var product: [Product]
}

struct Product {
    var productName: String
    var productPrice: Int
    var orderCount: Int
}


struct PizzaAllData {
    let 슈퍼시드: [String: Int] = [
        "글램핑 바비큐": 10000,
        "알로하 하와이안": 10000,
        "우리 고구마": 10000,
        "콰트로 치즈 퐁듀": 10000
    ]
    
    let 프리미엄: [String: Int] = [
        "더블크러스트 이베리코": 10000,
        "블랙앵거스 스테이크": 10000,
        "블랙타이거 슈림프": 10000,
        "와규 앤 비스테카": 10000,
        "직화 스테이크": 10000
    ]
    
    let 클래식: [String: Int] = [
        "베이컨체더치즈": 10000,
        "불고기": 10000,
        "슈퍼디럭스": 10000,
        "슈퍼슈프림": 10000,
        "페퍼로니": 10000,
        "포테이토": 10000
    ]
    
    let 사이드: [String: Int] = [
        "딸기 슈크림": 7000,
        "슈퍼곡물 치킨": 7000,
        "애플 크러스트 디저트": 7000,
        "치킨퐁듀 그라탕": 7000,
        "퀴노아 치킨 샐러드": 7000,
        "포테이토 순살치킨": 7000
    ]
    
    let 음료: [String: Int] = [
        "미닛메이드 스파클링 청포도": 3000,
        "스프라이트": 3000,
        "코카콜라 제로": 3000,
        "코카콜라": 3000
    ]
    
    let 소스: [String: Int] = [
        "갈릭 디핑 소스": 500,
        "스위트 칠리소스": 500,
        "우리 피클 L": 500,
        "우리 피클 M": 500,
        "핫소스": 500
    ]
}
