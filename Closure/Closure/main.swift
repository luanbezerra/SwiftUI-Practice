//
//  main.swift
//  Closure
//
//  Created by Luan Bezerra Coelho on 08/05/24.
//

import Foundation

func addTwoInts (a: Int, b: Int) -> Int {
    return a + b
}

//rint(addTwoInts(a: 4, b: 3))

var addTwoIntys = {(a: Int, b: Int) -> Int in
    return a + b
}

var cunty: (Int, Int) -> Int = { $0 + $1 }


//addTwoIntys(1, 1)
//print(cunty(1, 2))

let numbers = [1, 2, 3, 4, 5]

func sqrtnum(array: [Int]) -> [Int]{
    var result: [Int] = []
    for number in array {
        result.append(number * number)
    }
    return result
}

let squaredArray = sqrtnum(array: numbers)

//print(squaredArray)

var sqrtint: (Int) -> Int = { a in a * a }

sqrtint = {$0 * $0}

let input = [1, 2, 3]

let resultado = input.map(sqrtint)

let teste = input.map{$0 * $0}

//print(resultado)
//print(teste)

func guardy() -> Int? {
    return nil
}

var x: Int?

func aff(){
    guard let name = guardy() else {
        return
    }
    print("oi")
    print(name)
}
