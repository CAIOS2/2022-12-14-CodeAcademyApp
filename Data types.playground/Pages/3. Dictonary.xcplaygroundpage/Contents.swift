//: [Previous](@previous)

import Foundation
                
            // key : Value
var someDict: [Int: String] = [
    13123: "1",
    2233: "2"
]

let someArray = ["1", "2", "3"]

//someDict[1] = nil
//print(someDict[5])
//print(someArray[1...2])

let emptyArray: [Int] = []
let emptyDict: [Int: String] = [:]
let anotherEmptyDict = [Int: String]()


//var array: [Int?] = [1, 2, 3, nil, 5]
//array[1] = nil
//
//array.forEach { value in
//    print(value)
//}

someDict.forEach { value in
    print(value)
}

let index = someDict.firstIndex(where: { $0.value.hasPrefix("1") })

let anotherIndex = someArray.firstIndex(where: { $0.hasPrefix("1") })

print(index)
print(anotherIndex)

//: [Next](@next)
