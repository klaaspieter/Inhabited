struct Inhabited<C: Collection> {
  private var collection: C

  init?(_ collection: C) {
    guard !collection.isEmpty else { return nil }
    self.collection = collection
  }

  var count: Int {
    return collection.count
  }

  var isEmpty: Bool {
    return false
  }

  var first: C.Element {
    return collection.first!
  }
}

extension Inhabited: Equatable where C: Equatable {
  static func == (lhs: Inhabited<C>, rhs: Inhabited<C>) -> Bool {
    return lhs.collection == rhs.collection
  }
}

extension Inhabited: MutableCollection where C: MutableCollection {
  typealias Element = C.Element
  typealias SubSequence = C.SubSequence

  subscript(position: C.Index) -> C.Element {
    get {
      return collection[position]
    }
    set {
      collection[position] = newValue
    }
  }
}

extension Inhabited: Collection {
  typealias Index = C.Index
  typealias Iterator = C.Iterator

  var startIndex: C.Index {
    return collection.startIndex
  }

  var endIndex: C.Index {
    return collection.endIndex
  }

  func index(after i: C.Index) -> C.Index {
    return collection.index(after: i)
  }

  subscript(position: C.Index) -> C.Element {
    return collection[position]
  }
}

extension Inhabited: Sequence {
  func makeIterator() -> C.Iterator {
    return collection.makeIterator()
  }
}
