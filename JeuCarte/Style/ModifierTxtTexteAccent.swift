import SwiftUI
struct TexteAccent: ViewModifier {
  func body(content: Content) -> some View {
    return content
      .font(.system(.largeTitle))
      .padding()
      .foregroundColor(Color.accentColor)
      .shadow(color: .gray, radius: 5, x: 0, y: 8)
  }
}
