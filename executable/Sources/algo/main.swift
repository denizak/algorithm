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

func sortUsingBucketSort() {
    let startTime = Date()
    let sorted = bucketSorted(array: array)
    let duration = Date().timeIntervalSince(startTime)
    print("bucket sort duration \(duration)")

    assert(sorted.first == firstItem)
}

func sortUsingQuickSort() {
    let startTime = Date()
    let sorted = quickSorted(array: array)
    let duration = Date().timeIntervalSince(startTime)
    print("quick sort duration \(duration)")

    assert(sorted.first == firstItem)
}

sortUsingDefault()
sortUsingMergeSort()
sortUsingBucketSort()
sortUsingQuickSort()
