import Foundation

func bucketSorted(array: [Int]) -> [Int] {
    if array.isEmpty { return array }
    let maxItem = array.max()!
    let minItem = array.min()!
    var placeholders = [Int: Bool]()

    (minItem...maxItem).forEach { placeholders[$0] = false }
    array.forEach { placeholders[$0] = true }

    return (minItem...maxItem)
        .filter { placeholders[$0] != nil && placeholders[$0]! }
        .compactMap { $0 }
}
