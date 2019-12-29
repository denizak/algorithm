//: [Previous](@previous)

import Foundation

let firstItem = 1
let lastItem = 2000

func bucketSorted(array: [Int]) -> [Int] {
    let maxItem = array.max()!
    let minItem = array.min()!
    var placeholders = [Int: Bool]()

    (minItem...maxItem).forEach { placeholders[$0] = false }
    array.forEach { placeholders[$0] = true }

    var sortedArray = [Int]()
    (minItem...maxItem)
        .forEach {
            if let value = placeholders[$0],
                value { sortedArray.append($0) }
    }

    return sortedArray
}

let shuffled = (firstItem...lastItem).shuffled()
let startTime = Date()
let ordered = bucketSorted(array: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == firstItem
ordered.last == lastItem

//: [Next](@next)
