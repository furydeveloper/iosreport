import UIKit
import PlaygroundSupport

/*
 Q4. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
 */
/***********************************************************************************
 let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
 let isAscending: Bool
 if s1 > s2 {
 isAscending = true
 } else {
 isAscending = false
 }
 return isAscending
 }
 ***********************************************************************************/

let someClosure: (String, String) -> Bool = { $0 > $1 }

/***********************************************************************************
 let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
 var count: Int = 0
 for _ in values {
 count += 1
 }
 return count
 }
 ***********************************************************************************/

let otherClosure: ([Int]) -> Int = { $0.count }

/*
 Q5. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 */

func combineString(str1: String?, str2: String?, str3: String?) -> String {
    var result: String = ""
    if let results = str1 ?? nil {
        result += results
    }
    if let results = str2 ?? nil {
        result += results
    }
    if let reuslts = str3 ?? nil {
        result += reuslts
    }
    
    return result
}
combineString(str1: "h", str2: "i", str3: nil)

// 입력 예시 및 결과
//combineString(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF"
//combineString(str1: "AB", str2: nil, str3: "EF") -> "ABEF"
