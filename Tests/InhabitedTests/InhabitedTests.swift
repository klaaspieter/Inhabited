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

  func testStartIndexArray() {
    let array = [1]
    let collection = Inhabited(array)

    XCTAssertEqual(collection?.startIndex, array.startIndex)
  }

  func testEndIndexArray() {
    let array = [1]
    let collection = Inhabited(array)

    XCTAssertEqual(collection?.endIndex, array.endIndex)
  }

  func testSubscriptArray() {
    let array = [1, 2, 3]
    let collection = Inhabited(array)

    XCTAssertEqual(collection?[2], array[2])
  }

  func testIndexAfterArray() {
    let array = [1, 2, 3]
    let collection = Inhabited(array)

    XCTAssertEqual(collection?.index(after: 0), array.index(after: 0))
  }

  func testInitEmptyString() {
    let collection = Inhabited("")

    XCTAssertNil(collection)
  }

  func testInitInhabitedString() {
    let collection = Inhabited("hello")

    XCTAssertNotNil(collection)
  }

  func testStartIndexString() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.startIndex, string.startIndex)
  }

  func testEndIndexString() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.endIndex, string.endIndex)
  }

  func testSubscriptString() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?[string.startIndex], string[string.startIndex])
  }

  func testIndexAfterString() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(
      collection?.index(after: string.startIndex), string.index(after: string.startIndex)
    )
  }

  static var allTests = [
    ("testInitEmptyArray", testInitEmptyArray),
    ("testInitInhabitedArray", testInitInhabitedArray),
    ("testStartIndexArray", testStartIndexArray),
    ("testEndIndexArray", testEndIndexArray),
    ("testSubscriptArray", testSubscriptArray),
    ("testIndexAfterArray", testIndexAfterArray),
    ("testInitEmptyString", testInitEmptyString),
    ("testInitInhabitedString", testInitInhabitedString),
    ("testStartIndexString", testStartIndexArray),
    ("testEndIndexString", testEndIndexString),
    ("testSubscriptString", testSubscriptString),
    ("testIndexAfterString", testIndexAfterString),
  ]
}
