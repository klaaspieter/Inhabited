struct Inhabited<C: Collection> {
  init?(_ collection: C) {
    guard !collection.isEmpty else { return nil }
  }
}
