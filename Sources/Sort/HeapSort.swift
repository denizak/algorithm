typealias Index = Int

public func heapSorted<T: Comparable>(items: [T]) -> [T] {

    var tempItems = items
    let count = tempItems.count / 2 - 1
    for index in (0...count).reversed() {
        tempItems = heapify(items: tempItems, count: tempItems.count, startIndex: index)
    }

    for index in tempItems.indices.reversed() {
        tempItems.swapAt(0, index)
        tempItems = heapify(items: tempItems, count: index, startIndex: 0)
    }

    return tempItems
}

private func heapify<T: Comparable>(items: [T], count: Int, startIndex: Index) -> [T] {

    var tempItems = items
    var largest = startIndex
    let left = leftChildIndex(of: startIndex)
    let right = rightChildIndex(of: startIndex)
    
    if left < count && items[left] > items[largest] {
        largest = left
    }
    if right < count && items[right] > items[largest] {
        largest = right
    }
 
    if largest != startIndex {
        tempItems.swapAt(startIndex, largest)
        return heapify(items: tempItems, count: count, startIndex: largest)
    } else {
        return tempItems
    }
}

private func leftChildIndex(of index: Index) -> Index {
    return 2 * index + 1
}

private func rightChildIndex(of index: Index) -> Index {
    return 2 * index + 2
}