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

  func testEqual() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection, Inhabited(string))
  }

  func testNotEqual() {
    let string = "hello"
    let collection = Inhabited("bye")

    XCTAssertNotEqual(collection, Inhabited(string))
  }
}
