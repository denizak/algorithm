func insertionSorted(array: [Int]) -> [Int] {
    var tempArray = array
    for index in 1..<array.count {
        var moveIndex = index
        let temp = tempArray[moveIndex]
        while moveIndex > 0 && temp < tempArray[moveIndex - 1] {
            tempArray[moveIndex] = tempArray[moveIndex - 1]
            moveIndex -= 1
        }
        tempArray[moveIndex] = temp
    }

    return tempArray
}