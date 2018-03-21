public struct Inhabited<Element> {
  private let head: Element
  private let tail: [Element]

  public init?<C: Collection>(_ collection: C) where C.Element == Element {
    guard let head = collection.first else { return nil }
    self.head = head
    self.tail = Array(collection.dropFirst())
  }
}
