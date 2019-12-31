import Foundation

func bucketSorted(array: [Int]) -> [Int] {
    let maxItem = array.max()!
    let minItem = array.min()!
    var placeholders = [Int: Bool]()

    (minItem...maxItem).forEach { placeholders[$0] = false }
    array.forEach { placeholders[$0] = true }

    var sortedArray = [Int]()
    (minItem...maxItem)
        .forEach {
            if let value = placeholders[$0],
                value { sortedArray.append($0) }
    }

    return sortedArray
}
