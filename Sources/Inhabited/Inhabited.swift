public struct Inhabited<C: Collection> {
  private var collection: C

  public init?(_ collection: C) {
    guard !collection.isEmpty else { return nil }
    self.collection = collection
  }

  public var count: Int {
    return collection.count
  }

  public var isEmpty: Bool {
    return false
  }

  public var first: C.Element {
    return collection.first!
  }
}

extension Inhabited: RangeReplaceableCollection where C: RangeReplaceableCollection {
  public init() {
    preconditionFailure("An Inhabited collection cannot be initialized without elements")
  }

  public mutating func replaceSubrange<C>(
    _ subrange: Range<Index>,
    with newElements: C
  ) where C : Collection, C.Element == Element {
    var newCollection = collection
    newCollection.replaceSubrange(subrange, with: newElements)

    guard !newCollection.isEmpty else {
      preconditionFailure("Cannot remove the last element from a Inhabited collection")
    }

    collection = newCollection
  }
}

extension Inhabited: Equatable where C: Equatable {
  public static func == (lhs: Inhabited<C>, rhs: Inhabited<C>) -> Bool {
    return lhs.collection == rhs.collection
  }
}

extension Inhabited: MutableCollection where C: MutableCollection {
  public typealias Element = C.Element
  public typealias SubSequence = C.SubSequence

  public subscript(position: C.Index) -> C.Element {
    get {
      return collection[position]
    }
    set {
      collection[position] = newValue
    }
  }
}

extension Inhabited: Collection {
  public typealias Index = C.Index
  public typealias Iterator = C.Iterator

  public var startIndex: C.Index {
    return collection.startIndex
  }

  public var endIndex: C.Index {
    return collection.endIndex
  }

  public func index(after i: C.Index) -> C.Index {
    return collection.index(after: i)
  }

  public subscript(position: C.Index) -> C.Element {
    return collection[position]
  }
}

extension Inhabited: Sequence {
  public func makeIterator() -> C.Iterator {
    return collection.makeIterator()
  }
}
