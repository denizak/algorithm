//: [Previous](@previous)

import Foundation

let firstItem = 1
let lastItem = 2000

func radixSorted(array: [Int]) -> [Int] {

    let base = 10
    var finished = false
    var digits = 1

    var results = array
    while !finished {
        finished = true
        var buckets: [[Int]] = .init(repeating: [], count: base)

        results.forEach {
            number in

            let remainingPart = number / digits
            let currentDigit = remainingPart % base

            buckets[currentDigit].append(number)
            if remainingPart > 0 {
                finished = false
            }
        }

        digits *= base
        results = buckets.flatMap { $0 }
    }

    return results
}

let shuffled = (firstItem...lastItem).shuffled()
let startTime = Date()
let ordered = radixSorted(array: shuffled)
let duration = Date().timeIntervalSince(startTime)
print("duration \(duration)")
ordered.first == firstItem
ordered.last == lastItem


//: [Next](@next)
