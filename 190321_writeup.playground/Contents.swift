import UIKit
import PlaygroundSupport

/*
 Q1. 첨부된 이미지를 보고 상속을 이용해 구현해보기
 */

class Animal {
    var brain = true
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Human: Animal {
    
}

let person = Human(legs: 2)
person.legs

class Pet: Animal {
    var fleas: Int
    
    init(fleas: Int) {
        self.fleas = fleas
        super.init(legs: 4)
    }
}

class Dog: Pet {
    
}

class Cat: Pet {
    
}

/*
 Q2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고
 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
 (클래스 구현 연습)
 */

class Square {
    let s: Double
    
    init(s: Double) {
        self.s = s
    }
    
    func area() -> Double {
        return s * s
    }
    
    func round() -> Double {
        return 4 * s
    }
}

class Rectangle {
    let l: Double
    let w: Double
    
    init(l: Double, w: Double) {
        self.l = l
        self.w = w
    }
    
    func area() -> Double {
        return l * w
    }
    
    func round() -> Double {
        return (2 * l) + (2 * w)
    }
}

class Circle {
    let pi = 3.14
    let r: Double
    
    init(r: Double) {
        self.r = r
    }
    
    func area() -> Double {
        return pi * r * r
    }
    
    func round() -> Double {
        return 2 * pi * r
    }
}

class Triangle {
    let b: Double
    let h: Double
    
    init(b: Double, h: Double) {
        self.b = b
        self.h = h
    }
    
    func area() -> Double {
        return 0.5 * b * h
    }
}

class Trapezoid {
    let a: Double
    let b: Double
    let h: Double
    
    init(a: Double, b: Double, h: Double) {
        self.a = a
        self.b = b
        self.h = h
    }
    
    func area() -> Double {
        return (0.5 * h) * (a + b)
    }
}

class Cube {
    let s: Double
    
    init(s: Double) {
        self.s = s
    }
    
    func volume() -> Double {
        return s * s * s
    }
}

class RectangularSolid {
    let l: Double
    let w: Double
    let h: Double
    
    init(l: Double, w: Double, h: Double) {
        self.l = l
        self.w = w
        self.h = h
    }
    
    func volume() -> Double {
        return l * w * h
    }
}

class CircularCylinder {
    let r: Double
    let h: Double
    
    init(r: Double, h: Double) {
        self.r = r
        self.h = h
    }
    
    func volume() -> Double {
        return r * r * h
    }
}

class Sphere {
    let pi = 3.14
    let r: Double
    
    init(r: Double) {
        self.r = r
    }
    
    func volume() -> Double {
        return 3 / (4 * (pi * r * r * r))
    }
}


class Cone {
    let pi = 3.14
    let r: Double
    let h: Double
    
    init(r: Double, h: Double) {
        self.r = r
        self.h = h
    }
    
    func volume() -> Double {
        return 3 / (pi * r * r * h)
    }
}
