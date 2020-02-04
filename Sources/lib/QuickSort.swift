public func quickSorted<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else { return array }

    let pivot = array[array.count/2]

    let lessItems = array.filter { $0 <  pivot }
    let middleItems = array.filter { $0 == pivot }
    let greaterItems = array.filter { $0 > pivot }

    return quickSorted(array: lessItems) + middleItems + quickSorted(array: greaterItems)
}