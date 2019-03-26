import UIKit
import PlaygroundSupport

/*
 Q1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
 */

// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기

class Dog {
    var name: String
    var age: Int
    var weight: Double
    var kinds: String
    
    init(name: String, age: Int, weight: Double, kinds: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.kinds = kinds
    }
    
    func bark() {
        print("나의 강아지 \(name)(이)가 왈왈 짖는다.")
    }
    
    func eat() {
        print("강아지 \(name) (이)가 사료를 먹는다.")
    }
}

// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기

class Student {
    var name: String
    var age: Int
    var school: String
    var grade: Int
    
    init(name: String, age: Int, school: String, grade: Int) {
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
    
    func study() {
        print("\"\(name)\"(이)는 공부중!")
    }
    
    func eat() {
        print("\"\(name)\"(이)는 먹는중!")
    }
    
    func sleep() {
        print("\"\(name)\"(이)는 자는중!")
    }
}

// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송

class IPhone {
    var deviceName: String
    var price: Int
    var isFaceID: Bool
    
    init(deviceName: String, price: Int, isFaceID: Bool) {
        self.deviceName = deviceName
        self.price = price
        self.isFaceID = isFaceID
    }
    
    func callToSomeone(to: String) {
        print("\"\(to)\"에게 전화를 거는 중입니다.")
    }
    
    func sendMessage(to: String, msg: String) {
        print("\"\(to)\"에게 보내는 문자 내용 \n -> \(msg)")
    }
}

var test = IPhone(deviceName: "XS", price: 2_000_000, isFaceID: true)

test.sendMessage(to: "철수", msg: "철수야 안녕! 잘 지내지? 잘 살아!")

// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지

class Coffee {
    var name: String
    var price: Int
    var origin: String
    
    init(name: String, price: Int, origin: String) {
        self.name = name
        self.price = price
        self.origin = origin
    }
}

/*
 Q2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 */

/************************************************************************
 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
************************************************************************/

class Calculator {
    var value: Double = 0
    
    func add(_ addValue: Double) -> Double {
        value += addValue
        return value
    }
    
    func subtract(_ subValue: Double) -> Double {
        value -= subValue
        return value
    }
    
    func multiply(_ mulValue: Double) -> Double {
        value *= mulValue
        return value
    }
    
    func divide(_ divValue: Double) -> Double {
        value /= divValue
        return value
    }
    
    func reset() -> Double {
        value = 0
        return value
    }
}


let calculator = Calculator() // 객체생성

calculator.value  // 0

calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0
