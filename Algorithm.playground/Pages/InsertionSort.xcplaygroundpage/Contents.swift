//: [Previous](@previous)

import Foundation

let firstItem = 1
let lastItem = 2000

func insertionSorted(array: [Int]) -> [Int] {
    var tempArray = array
    for index in 1..<array.count {
        var moveIndex = index
        let temp = tempArray[moveIndex]
        while moveIndex > 0 && temp < tempArray[moveIndex - 1] {
            tempArray[moveIndex] = tempArray[moveIndex - 1]
            moveIndex -= 1
        }
        tempArray[moveIndex] = temp
    }

    return tempArray
}

let shuffled = (firstItem...lastItem).shuffled()
let startTime = Date()
let ordered = insertionSorted(array: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == firstItem
ordered.last == lastItem

//: [Next](@next)
