import XCTest

import libTests

var tests = [XCTestCaseEntry]()
tests += libTests.allTests()
XCTMain(tests)
