private func isOrdered<T: Comparable>(array: [T]) -> Bool {
    for i in 1..<array.count {
        if array[i-1] >= array[i] {
            return false
        }
    }
    return true
}

func bogoSorted<T: Comparable>(array: [T]) -> [T] {
    var tempArray = array
    while !isOrdered(array: tempArray) {
        tempArray = tempArray.shuffled()
    }
    return tempArray
}