//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

struct ReceiptItem: Hashable {
    let name: String
    let price: Double
    let quantity: Int
    let salePrice: Double
}

let item1 = ReceiptItem(name: "Brokolis", price: 1.00, quantity: 1, salePrice: 0.79)
let item2 = ReceiptItem(name: "Bananai", price: 1.29, quantity: 1, salePrice: 0.99)
let item3 = ReceiptItem(name: "Agurkai", price: 0.49, quantity: 1, salePrice: 0.39)

var someVar: Set = [item1, item2, item3]

let item4 = ReceiptItem(name: "Brokolis", price: 1.0, quantity: 1, salePrice: 0.79) // Neprideda
someVar.insert(item4)

let item5 = ReceiptItem(name: "Brokolis", price: 1.0, quantity: 1, salePrice: 0.9) // Prideda
someVar.insert(item5)


for item in someVar {
    print(item)
}

//: [Next](@next)
