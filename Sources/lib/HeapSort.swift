typealias Index = Int

func heapSorted(items: [Int]) -> [Int] {

    var tempItems = maxHeapify(items: items)
    var resultItems = [Int]()
    
    let indices = items.indices.reversed()
    for lastIndex in indices {
        let subItems = Array(tempItems[0...lastIndex])

        tempItems = heapify(items: subItems)
        tempItems.swapAt(0, lastIndex)
        
        resultItems.insert(tempItems.removeLast(), at: 0)
    }

    return resultItems
}

private func maxHeapify(items: [Int]) -> [Int] {
    var tempItems = items
    var rootIndex = items.count / 2
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

private func heapify(items: [Int]) -> [Int] {
    var tempItems = items
    
    for rootIndex in 0...(items.count / 2) {
        var largeIndex = rootIndex
        let leftIndex = leftChildIndex(of: rootIndex)
        if leftIndex < tempItems.count &&
            tempItems[leftIndex] > tempItems[rootIndex] {
            largeIndex = leftIndex
        }

        let rightIndex = rightChildIndex(of: rootIndex)
        if rightIndex < tempItems.count &&
            tempItems[rightIndex] > tempItems[rootIndex] {
            largeIndex = rightIndex
        }

        if largeIndex == rootIndex { break }
        tempItems.swapAt(largeIndex, rootIndex)
    }
    
    return tempItems
}

private func leftChildIndex(of index: Index) -> Index {
    return 2 * index + 1
}

private func rightChildIndex(of index: Index) -> Index {
    return 2 * index + 2
}