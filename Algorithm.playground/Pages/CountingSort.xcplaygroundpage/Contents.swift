//: [Previous](@previous)

import Foundation

let firstItem = 1
let lastItem = 2000

func countingSorted(array: [Int]) -> [Int] {
    guard !array.isEmpty else { return array }
    let max = array.max()!

    var itemCountPosition = [Int](repeating: 0, count: max + 1)
    array.forEach {
        itemCountPosition[$0] += 1
    }

    var tempSorted = [Int]()
    for i in itemCountPosition.indices {
        if itemCountPosition[i] > 0 {
            tempSorted.append(contentsOf: [Int](repeating: i, count: itemCountPosition[i]))
        }
    }

    return tempSorted
}

let shuffled = (firstItem...lastItem).shuffled()
let startTime = Date()
let ordered = countingSorted(array: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == firstItem
ordered.last == lastItem

//: [Next](@next)
