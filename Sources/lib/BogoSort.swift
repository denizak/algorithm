private func isOrdered(array: [Int]) -> Bool {
    for i in 1..<array.count {
        if array[i-1] >= array[i] {
            return false
        }
    }
    return true
}

func bogoSorted(array: [Int]) -> [Int] {
    var tempArray = array
    while !isOrdered(array: tempArray) {
        tempArray = tempArray.shuffled()
    }
    return tempArray
}