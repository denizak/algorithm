import XCTest
@testable import lib

final class libTests: XCTestCase {

    let firstItem = 1
    let lastItem = 2000

    func testQuickSort() {
        let array = (firstItem...lastItem).shuffled()
        measure {
            let sorted = quickSorted(array: array)

            XCTAssertEqual(sorted.first, firstItem)
            XCTAssertEqual(sorted.last, lastItem)
        }
    }

    func testMergeSort() {
        let array = (firstItem...lastItem).shuffled()

        measure {
            let sorted = mergeSorted(array: array)

            XCTAssertEqual(sorted.first, firstItem)
            XCTAssertEqual(sorted.last, lastItem)
        }
    }

    func testBucketSort() {
        let array = (firstItem...lastItem).shuffled()

        measure {
            let sorted = bucketSorted(array: array)

            XCTAssertEqual(sorted.first, firstItem)
            XCTAssertEqual(sorted.last, lastItem)
        }
    }

    func testInsertionSort() {
        let array = (firstItem...lastItem).shuffled()

        measure {
            let sorted = insertionSorted(array: array)

            XCTAssertEqual(sorted.first, firstItem)
            XCTAssertEqual(sorted.last, lastItem)
        }
    }

    static var allTests = [
        ("testQuickSort", testQuickSort),
        ("testMergeSort", testMergeSort),
        ("testBucketSort", testBucketSort),
        ("testInsertionSort", testInsertionSort),
    ]
}
