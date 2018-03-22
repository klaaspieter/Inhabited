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

  func testInitFromFiniteSequence() {
    var count = 0
    // returns 1...3
    let iterator = AnyIterator({ () -> Int? in
      if count > 3 {
        return .none
      } else {
        defer { count += 1}
        return count
      }
    })
    let collection = Inhabited(iterator)

    XCTAssertEqual(collection, Inhabited([0, 1, 2, 3]))
  }

  func testInitFromEmptySequence() {
    let collection = Inhabited<Int>(EmptyIterator())

    XCTAssertNil(collection)
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

  func testSubscriptGet() {
    let string = "hello"
    let collection = Inhabited(string)!

    XCTAssertEqual(collection[collection.startIndex], string[string.startIndex])
  }

  func testSubscriptGetAfterStartIndex() {
    let array = [0, 1, 2, 3]
    let collection = Inhabited(array)

    XCTAssertEqual(collection?[2], array[2])
  }

  func testSubscriptSet() {
    let array = [1, 1, 3]
    var collection = Inhabited(array)

    collection?[1] = 2

    XCTAssertEqual(collection, Inhabited([1, 2, 3]))
  }

  func testIndexAfter() {
    let array = [0, 1, 2, 3]
    let collection = Inhabited(array)

    XCTAssertEqual(
      collection?.index(after: 2),
      array.index(after: 2)
    )
  }

  func testCount() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.count, string.count)
  }

  func testFirst() {
    let string = "hello"
    let collection = Inhabited(string)

    XCTAssertEqual(collection?.first, string.first)
  }

  func testIterator() {
    let string = "hi!"
    let collection = Inhabited(string)
    let iterator = collection?.makeIterator()

    XCTAssertEqual(iterator?.next(), "h")
    XCTAssertEqual(iterator?.next(), "i")
    XCTAssertEqual(iterator?.next(), "!")
    XCTAssertNil(iterator?.next())
  }

  func testInsertAtStart() {
    var collection = Inhabited("ello")

    collection?.insert("h", at: 0)

    XCTAssertEqual(collection, Inhabited("hello"))
  }

  func testInsertInMiddle() {
    var collection = Inhabited("helo")

    collection?.insert("l", at: 2)

    XCTAssertEqual(collection, Inhabited("hello"))
  }
}
