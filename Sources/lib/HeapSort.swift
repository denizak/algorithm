typealias Index = Int

func heapSorted(items: [Int]) -> [Int] {

    var tempItems = items
    var resultItems = [Int]()
    for lastIndex in tempItems.indices.reversed() {
        let subItems = Array(tempItems[0...lastIndex])

        tempItems = heapify(items: subItems)
        tempItems.swapAt(0, lastIndex)

        resultItems.insert(tempItems[lastIndex], at: 0)
    }

    return resultItems
}

private func heapify(items: [Int]) -> [Int] {
    var tempItems = items
    for rootIndex in tempItems.indices.reversed() {
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
    }
    return tempItems
}

private func leftChildIndex(of index: Index) -> Index {
    return 2 * index + 1
}

private func rightChildIndex(of index: Index) -> Index {
    return 2 * index + 2
}