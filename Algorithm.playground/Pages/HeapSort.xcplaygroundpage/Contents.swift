//: [Previous](@previous)

import Foundation

typealias Index = Int

func heapSorted(items: [Int]) -> [Int] {

    var resultItems = [Int]()
    var tempItems = maxHeapify(items: items)

    tempItems.swapAt(0, tempItems.count - 1)
    resultItems.insert(tempItems.removeLast(), at: 0)

    let indices = tempItems.indices.reversed()
    for lastIndex in indices {
        let subItems = Array(tempItems[0...lastIndex])

        tempItems = maxHeapify(items: subItems)

        tempItems.swapAt(0, lastIndex)
        resultItems.insert(tempItems.removeLast(), at: 0)
    }

    return resultItems
}

private func maxHeapify(items: [Int]) -> [Int] {
    var tempItems = items
    var rootIndex = items.count / 2 - 1
    while rootIndex >= 0 {
        let leftIndex = leftChildIndex(of: rootIndex)
        if leftIndex < tempItems.count &&
            tempItems[leftIndex] > tempItems[rootIndex] {
            tempItems.swapAt(leftIndex, rootIndex)
        }

        let rightIndex = rightChildIndex(of: rootIndex)
        if rightIndex < tempItems.count &&
            tempItems[rightIndex] > tempItems[rootIndex] {
            tempItems.swapAt(rightIndex, rootIndex)
        }

        rootIndex -= 1
    }
    return tempItems
}

private func leftChildIndex(of index: Index) -> Index {
    return 2 * index + 1
}

private func rightChildIndex(of index: Index) -> Index {
    return 2 * index + 2
}

let firstItem = 1
let lastItem = 2000
let shuffled = (firstItem...lastItem).shuffled()
let startTime = Date()
let ordered = heapSorted(items: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == firstItem
ordered.last == lastItem




//: [Next](@next)
