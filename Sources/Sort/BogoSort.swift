extension Array where Element: Comparable {
    var isOrdered: Bool {
        for i in 1..<self.count {
            if self[i-1] > self[i] {
                return false
            }
        }
        return true
    }
}

func bogoSorted<T: Comparable>(array: [T]) -> [T] {
    var tempArray = array
    while !tempArray.isOrdered {
        tempArray = tempArray.shuffled()
    }
    return tempArray
}