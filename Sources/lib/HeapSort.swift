typealias Index = Int

func heapSorted(items: [Int]) -> [Int] {

    var resultItems = [Int]()

    var tempItems = items
    let count = items.count / 2 - 1
    for i in (0...count).reversed() {
        tempItems = heapify(items: tempItems, n: items.count, i: i)
    }

    for i in (0...tempItems.count-1).reversed() {
        tempItems.swapAt(0, tempItems.count - 1)
        resultItems.insert(tempItems.removeLast(), at: 0)

        tempItems = heapify(items: tempItems, n: i, i: 0)
    }

    return resultItems
}

private func heapify(items: [Int], n: Int, i: Int) -> [Int] {

    var tempItems = items
    var largest = i
    let left = leftChildIndex(of: i)
    let right = rightChildIndex(of: i)
    
    if left < n && items[left] > items[largest] {
        largest = left
    }
    if right < n && items[right] > items[largest] {
        largest = right
    }
 
    if largest != i {
        tempItems.swapAt(i, largest)

        return heapify(items: tempItems, n: n, i: largest)
    }

    return tempItems
}

private func leftChildIndex(of index: Index) -> Index {
    return 2 * index + 1
}

private func rightChildIndex(of index: Index) -> Index {
    return 2 * index + 2
}