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

    func testBogoSort() {
        let array = (1...5).shuffled()

        measure {
            let sorted = bogoSorted(array: array)

            XCTAssertEqual(sorted.first, 1)
            XCTAssertEqual(sorted.last, 5)
        }
    }

    func testRadixSort() {
        let array = (firstItem...lastItem).shuffled()

        measure {
            let sorted = radixSorted(array: array)

            XCTAssertEqual(sorted.first, firstItem)
            XCTAssertEqual(sorted.last, lastItem)
        }
    }

    func testCountingSort() {
        let array = (firstItem...lastItem).shuffled()

        measure {
            let sorted = countingSorted(array: array)

            XCTAssertEqual(sorted.first, firstItem)
            XCTAssertEqual(sorted.last, lastItem)
        }
    }

    static var allTests = [
        ("testQuickSort", testQuickSort),
        ("testMergeSort", testMergeSort),
        ("testBucketSort", testBucketSort),
        ("testInsertionSort", testInsertionSort),
        ("testBogoSort", testBogoSort),
        ("testRadixSort", testRadixSort),
        ("testCountingSort", testCountingSort),
    ]
}
