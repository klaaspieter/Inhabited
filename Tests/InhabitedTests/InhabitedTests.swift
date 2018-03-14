import XCTest
@testable import Inhabited

class InhabitedTests: XCTestCase {
  func testInitEmptyArray() {
    let collection = Inhabited([])

    XCTAssertNil(collection)
  }

  func testInitInhabitedArray() {
    let collection = Inhabited([1])

    XCTAssertNotNil(collection)
  }

  func testInitEmptyString() {
    let collection = Inhabited("")

    XCTAssertNil(collection)
  }

  func testInitInhabitedString() {
    let collection = Inhabited("hello")

    XCTAssertNotNil(collection)
  }

  static var allTests = [
    ("testInitEmptyArray", testInitEmptyArray),
    ("testInitInhabitedArray", testInitInhabitedArray),
    ("testInitEmptyString", testInitEmptyString),
    ("testInitInhabitedString", testInitInhabitedString),
  ]
}
