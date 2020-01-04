func countingSorted(array: [Int]) -> [Int] {
    guard !array.isEmpty else { return array }
    let max = array.max()!

    var itemCountPosition = [Int](repeating: 0, count: max + 1)
    array.forEach {
        itemCountPosition[$0] += 1
    }

    var tempSorted = [Int]()
    for i in 0..<itemCountPosition.count {
        if itemCountPosition[i] > 0 {
            tempSorted.append(contentsOf: [Int](repeating: i, count: itemCountPosition[i]))
        }
    }

    return tempSorted
}