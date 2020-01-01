//: [Previous](@previous)

import Foundation

private func isOrdered(array: [Int]) -> Bool {
    for i in 1..<array.count {
        if array[i-1] >= array[i] {
            return false
        }
    }
    return true
}

func bogoSorted(array: [Int]) -> [Int] {
    var tempArray = array
    while !isOrdered(array: tempArray) {
        tempArray = tempArray.shuffled()
    }
    return tempArray
}

let shuffled = (1...5).shuffled()
let startTime = Date()
let ordered = bogoSorted(array: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == 1
ordered.last == 5

//: [Next](@next)
