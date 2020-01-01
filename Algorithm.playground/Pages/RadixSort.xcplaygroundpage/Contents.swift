//: [Previous](@previous)

import Foundation

let firstItem = 1
let lastItem = 2000

private func countingSort(array: [Int], exp: Int) -> [Int] {

    var output = [Int](repeating: 0, count: array.count)
    var count = [Int](repeating: 0, count: 12)

    var index = 0
    while index < array.count {
        let currentIndexCount = (array[index]/exp) % 10
        count[currentIndexCount] += 1
        index += 1
    }

    for i in 1..<12 {
        count[i] += count[i-1]
    }

    var startIndex = array.count - 1
    while startIndex >= 0 {
        output[ count[ (array[startIndex]/exp)%10 ] - 1 ] = array[startIndex]
        count[ (array[startIndex]/exp)%10] -= 1
        startIndex -= 1
    }

    return output
}

func radixSorted(array: [Int]) -> [Int] {
    let max = array.max()!
    var result = array
    var exp = 1
    while max/exp > 0 {
        result = countingSort(array: result, exp: exp)
        exp *= 10
    }

    return result
}

let shuffled = (firstItem...lastItem).shuffled()
let startTime = Date()
let ordered = radixSorted(array: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == firstItem
ordered.last == lastItem


//: [Next](@next)
