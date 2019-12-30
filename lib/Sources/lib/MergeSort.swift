import Foundation

class Merge {
    func ahoy() -> Int { Int.random(in: 1...10) }
}

func mergeSorted<T: Comparable>(array: [T]) -> [T] {
    let middleIndex = array.count / 2
    let lhs = Array(array[0..<middleIndex])
    let rhs = Array(array[middleIndex..<array.count])

    let sortedLhs = lhs.count > 1 ? mergeSorted(array: lhs) : lhs
    let sortedRhs = rhs.count > 1 ? mergeSorted(array: rhs) : rhs

    return mergeAndSort(lhs: sortedLhs, rhs: sortedRhs)
}

private func mergeAndSort<T: Comparable>(lhs: [T], rhs: [T]) -> [T] {
    var lhsIndex = 0
    var rhsIndex = 0
    var sortedArray = [T]()

    while lhsIndex < lhs.count && rhsIndex < rhs.count {
        if lhs[lhsIndex] < rhs[rhsIndex] {
            sortedArray.append(lhs[lhsIndex])
            lhsIndex += 1
        } else if lhs[lhsIndex] > rhs[rhsIndex] {
            sortedArray.append(rhs[rhsIndex])
            rhsIndex += 1
        } else {
            sortedArray.append(lhs[lhsIndex])
            sortedArray.append(rhs[rhsIndex])
            lhsIndex += 1
            rhsIndex += 1
        }
    }

    if lhsIndex == lhs.count {
        return sortedArray + Array(rhs[rhsIndex..<rhs.count])
    } else if rhsIndex == rhs.count {
        return sortedArray + Array(lhs[lhsIndex..<lhs.count])
    } else {
        return sortedArray
    }
}