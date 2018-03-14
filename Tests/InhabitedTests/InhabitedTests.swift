import Inhabited
import XCTest

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

  func testSubscriptGet() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?[string.startIndex], string[string.startIndex])
  }

  func testSubscriptSet() {
    let array = [1, 1, 3]
    var collection = Inhabited(array)

    collection?[1] = 2

    XCTAssertEqual(collection, Inhabited([1, 2, 3]))
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

  func testFirst() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.first, string.first)
  }

  func testEquatable() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection, Inhabited(string))
  }

  func testReplaceSubrange() {
    let array = [1, 1, 1, 4]
    var collection = Inhabited(array)

    collection?.replaceSubrange((1..<3), with: Inhabited([2, 3])!)

    XCTAssertEqual(collection, Inhabited([1, 2, 3, 4]))
  }

  // Intentionally comment as this will crash the test suite
//  func testRemoveLast() {
//    let array = [1]
//    var collection = Inhabited(array)
//
//    collection?.remove(at: 0)
//  }

  static var allTests = [
    ("testInitEmptyArray", testInitEmptyArray),
    ("testInitInhabitedArray", testInitInhabitedArray),
    ("testInitEmptyString", testInitEmptyString),
    ("testInitInhabitedString", testInitInhabitedString),

    ("testStartIndex", testStartIndex),
    ("testEndIndex", testEndIndex),
    ("testSubscriptGet", testSubscriptGet),
    ("testSubscriptSet", testSubscriptSet),
    ("testIndexAfter", testIndexAfter),
    ("testCount", testCount),
    ("testIsEmpty", testIsEmpty),
    ("testFirst", testFirst),
    ("testEquatable", testEquatable),
  ]
}
