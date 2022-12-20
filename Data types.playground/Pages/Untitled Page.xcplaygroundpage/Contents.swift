import UIKit

var greeting = "Hello, playground"

var myArray = Array([1, 2, 3, 4])
var mySet = Set([1, 1, 1, 2])

let myDictionary: [String: String] = ["myKey": "myValue", "myAnotherKey" : "myAnotherValue"]



myArray.append(1)
 
let (inserted, memberAfterInsert) = mySet.insert(1)
if !inserted {
    print("Value not inserted \(memberAfterInsert)")
} else {
    print("Inserted \(memberAfterInsert)")
}


var myAnotherSet: Set = ["👍"]
