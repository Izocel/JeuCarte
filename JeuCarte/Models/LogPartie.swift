import Foundation

struct LogPartie : Identifiable  {
    var id = UUID()
    private var gagner: Bool
    private var imageAssoc: String
}

extension LogPartie {
  init(gagner: Bool, imageAssoc: String) {

    self.gagner = gagner
    self.imageAssoc = imageAssoc
  }
}
