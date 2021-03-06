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

  public mutating func append(_ element: Element) {
    insert(element, at: endIndex)
  }

  public mutating func insert(_ element: Element, at index: Int) {
    insert(contentsOf: [element], at: index)
  }

  public mutating func insert<S: Sequence>(
    contentsOf sequence: S,
    at index: Int
  ) where S.Element == Element {
    if index == startIndex {
      var iterator = sequence.makeIterator()
      guard let newHead = iterator.next() else { return }

      var tailToInsert: [Element] = []
      while let element = iterator.next() {
        tailToInsert.append(element)
      }
      tailToInsert.append(head)
      self.tail.insert(contentsOf: tailToInsert, at: 0)

      self.head = newHead

    } else {
      tail.insert(contentsOf: Array(sequence), at: index - 1)
    }
  }

  public func removing(at position: Int) -> Inhabited<Element>? {
    return replacingSubrange(position..<index(after: position), with: [])
  }

  public func replacingSubrange<R: RangeExpression, C: Collection>(
    _ range: R,
    with newElements: C
  ) -> Inhabited<Element>? where C.Element == Element, R.Bound == Index {
    var array = Array(self)
    array.replaceSubrange(range, with: newElements)
    return Inhabited(array)
  }

  public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> Inhabited<Element>? {
    let array = try Array(self).filter(isIncluded)
    return Inhabited(array)
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

extension Inhabited: CustomStringConvertible  {
  public var description: String {
    if let head = head as? Character, let tail = tail as? [Character] {
      return "Inhabited(\"\(head)\(String(tail))\")"
    } else {
      return "Inhabited(\(Array(self)))"
    }
  }
}

extension Inhabited: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "Inhabited(head: \(head), tail: \(tail))"
  }
}

extension Inhabited: Equatable where Element: Equatable {}
extension Inhabited: Hashable where Element: Hashable {}
extension Inhabited: Decodable where Element: Decodable {}
extension Inhabited: Encodable where Element: Encodable {}
