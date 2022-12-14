//
//  Closure examples.swift
//  CodeAcademyApp
//
//  Created by Tadas Petrikas on 2022-12-14.
//

import Foundation


struct Present {
    let presentType: String
}

class Alice {
    typealias PresentOpenedCompletion = (Present?) -> Void
    
    var present: Present?
    var presentOpenedCompletion: PresentOpenedCompletion?
    
    func acceptPresent(_ present: Present, completion: PresentOpenedCompletion?) {
        print("#1")
        self.present = present
        self.presentOpenedCompletion = completion
        
        completion?(nil)
    }
    
    func didUnpactPresent() {
        print("#2")
        print("Is closure nil \(presentOpenedCompletion == nil)")
        presentOpenedCompletion?(present)
    }
}

let present = Present(presentType: "Playstation PS6")
let alice = Alice()

//#1 same behaviour
alice.acceptPresent(present) { presentValue in
    print(presentValue?.presentType)
}

//#2 same behaviour
//alice.aceptPresent(present) { print($0) }

//#3 same behaviour
//alice.aceptPresent(present, completion: { print($0) })

//#4 same behaviour
//alice.aceptPresent(present, completion: { boolValue in
//    print("#3")
//    print("🐓🐓🐓🐓🐓🐓🐓🐓🐓🐓🐓🐓🐓\(boolValue)")
//})
//alice.didUnpactPresent()

//#5 same behaviour
//func printThings(things: Present?) {
//    print("🌈🌈🌈🌈🌈🌈🌈 \(things?.presentType ?? "Ups empty ☠️")")
//}
//
//alice.acceptPresent(present, completion: printThings)
alice.didUnpactPresent()



