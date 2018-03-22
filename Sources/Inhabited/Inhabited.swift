public struct Inhabited<Element> {
  private var head: Element
  private var tail: [Element]

  public init?<S: Sequence>(_ elements: S) where S.Element == Element {
    var iterator = elements.makeIterator()
    guard let head = iterator.next() else { return nil }

    self.head = head
    self.tail = []
    while let element = iterator.next() {
      tail.append(element)
    }
  }

  public var count: Int {
    return tail.count + 1
  }

  public var isEmpty: Bool {
    return false
  }

  public var first: Element {
    return head
  }

  public mutating func insert(_ element: Element, at index: Int) {
    if index == startIndex {
      tail.insert(head, at: 0)
      head = element
    } else {
      tail.insert(element, at: index - 1)
    }
  }
}

extension Inhabited: Collection {
  public func index(after i: Int) -> Int {
    return i + 1
  }

  public var startIndex: Int {
    return 0
  }

  public var endIndex: Int {
    return tail.endIndex + 1
  }

  public typealias Index = Int
}

extension Inhabited: MutableCollection {
  public subscript(position: Int) -> Element {
    get {
      if position == startIndex {
        return head
      } else {
        return tail[position - 1]
      }
    }

    set {
      if position == startIndex {
        head = newValue
      } else {
        tail[position - 1] = newValue
      }
    }
  }
}

extension Inhabited: RandomAccessCollection {

}

extension Inhabited: Sequence {
  public func makeIterator() -> AnyIterator<Element> {
    var returnHead = true
    var tailIterator = tail.makeIterator()
    return AnyIterator({
      if returnHead {
        defer { returnHead = false }
        return self.head
      }
      return tailIterator.next()
    })
  }
}

extension Inhabited: Equatable where Element: Equatable {
  public static func == (lhs: Inhabited, rhs: Inhabited) -> Bool {
    return lhs.head == rhs.head && lhs.tail == rhs.tail
  }
}
