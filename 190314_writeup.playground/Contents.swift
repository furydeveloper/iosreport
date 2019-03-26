import UIKit
import PlaygroundSupport

/*
 Q1. 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
 ex) 123 -> 321 , 10293 -> 39201
 */
func returnReverse(num: Int) -> Int {
    guard num >= 0 else {
        print("자연수를 입력하세요.")
        return 0
    }
    
    var arrNum: [String] = []
    var strNum = String(num)
    
    for i in strNum.characters {
        arrNum.append(String(i))
    }
    
    arrNum.reverse()
    
    strNum = ""
    
    for i in arrNum {
        strNum.append(i)
    }
    
    let reverseNum = Int(strNum)!
    
    return reverseNum
}

returnReverse(num: 1235634)

/*
 Q2. 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
 */

var arrQ2 = ["a", "b", "c", "a", "e", "d", "c"]

func checkArr(array: [String]) -> [String] {
    var newArr = array
    var resultArr: [String] = []
    
    for i in 0...newArr.count - 1 {
        var count = 0
        for j in 0...newArr.count - 1 {
            if i == j { continue }
            
            if newArr[i] == newArr[j] {
                count += 1
            }
        }
        if count == 0 {
            resultArr.append(newArr[i])
        }
    }
    
    return resultArr
}

checkArr(array: arrQ2)

/*
 Q3. 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
 */

var arrQ3 = [2, 8, 7, 1, 4, 3]

func oddAndEven(arr: [Int]) -> [Int] {
    let newArr = arr
    var oddArr: [Int] = []
    var evenArr: [Int] = []
    var resultArr: [Int] = []
    
    for i in newArr {
        if i % 2 == 0 { evenArr.append(i) }
        else { oddArr.append(i) }
    }
    
    resultArr = oddArr + evenArr
    
    return resultArr
}

oddAndEven(arr: arrQ3)

/*
 Q4. 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
 */

enum Arithmetic {
    case addition, subtraction, multiplication, division
    
    func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Double {
        var result = 0.0
        switch op {
        case .addition:
            result = Double(operand1) + Double(operand2)
        case .subtraction:
            result = Double(operand1) - Double(operand2)
        case .multiplication:
            result = Double(operand1) / Double(operand2)
        case .division:
            result = Double(operand1) * Double(operand2)
        }
        
        return result
    }
}

var arithmeticAdd = Arithmetic.addition
var arithmeticSub = Arithmetic.subtraction
var arithmeticMul = Arithmetic.multiplication
var arithmeticDiv = Arithmetic.division

arithmeticAdd.calculator(operand1: 10, operand2: 20, op: arithmeticAdd)
arithmeticSub.calculator(operand1: 20, operand2: 10, op: arithmeticSub)
arithmeticMul.calculator(operand1: 20, operand2: 10, op: arithmeticMul)
arithmeticDiv.calculator(operand1: 20, operand2: 10, op: arithmeticDiv)

/*
 Q5. 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
 + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
 */

var animalDic = [
    "식육목": [
        "개과" : [
            "개" : ["자칼", "늑대", "북미산 이리"],
            "여우" : ["아메리카 여우", "유럽 여우"]
        ],
        "고양이과" : [
            "고양이" : ["고양이", "살쾡이"],
            "표범" : ["사자", "호랑이"],
        ],
    ]
]

if let ani1 = animalDic["식육목"] {
    if let ani2 = ani1["고양이과"] {
        if let ani3 = ani2["표범"] {
            print(ani3[0], ani3[1])
        }
    }
}
