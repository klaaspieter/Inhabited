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

  func testStartIndex() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.startIndex, string.startIndex)
  }

  func testEndIndex() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.endIndex, string.endIndex)
  }

  func testSubscript() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?[string.startIndex], string[string.startIndex])
  }

  func testIndexAfter() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(
      collection?.index(after: string.startIndex), string.index(after: string.startIndex)
    )
  }

  func testCount() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.count, string.count)
  }

  func testIsEmpty() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssert(collection?.isEmpty == false)
  }

  static var allTests = [
    ("testInitEmptyArray", testInitEmptyArray),
    ("testInitInhabitedArray", testInitInhabitedArray),
    ("testInitEmptyString", testInitEmptyString),
    ("testInitInhabitedString", testInitInhabitedString),

    ("testStartIndex", testStartIndex),
    ("testEndIndex", testEndIndex),
    ("testSubscript", testSubscript),
    ("testIndexAfter", testIndexAfter),
    ("testCount", testCount),
    ("testIsEmpty", testIsEmpty),
  ]
}
