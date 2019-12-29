import Foundation

let firstItem = 1
let lastItem = 2000

let array = (firstItem...lastItem).shuffled()

func sortUsingDefault() {
    let startTime = Date()
    let sorted = array.sorted()
    let duration = Date().timeIntervalSince(startTime)
    print("sort duration \(duration)")

    assert(sorted.first == firstItem)
}

func sortUsingMergeSort() {
    let startTime = Date()
    let sorted = mergeSorted(array: array)
    let duration = Date().timeIntervalSince(startTime)
    print("merge sort duration \(duration)")

    assert(sorted.first == firstItem)
}

sortUsingDefault()
sortUsingMergeSort()