public struct Inhabited<Element> {
  private var head: Element
  private var tail: [Element]

  public init?<C: Collection>(_ collection: C) where C.Element == Element {
    guard let head = collection.first else { return nil }
    self.head = head
    self.tail = Array(collection.dropFirst())
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
}

extension Inhabited: Collection {
  public func index(after i: Int) -> Int {
    return i + 1
  }

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

  public var startIndex: Int {
    return 0
  }

  public var endIndex: Int {
    return tail.endIndex + 1
  }

  public typealias Index = Int

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
