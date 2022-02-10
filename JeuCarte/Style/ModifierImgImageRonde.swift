import SwiftUI
struct ImageRonde: ViewModifier {
  func body(content: Content) -> some View {
    return content
      .frame(width: 75.0, height: 75.0)
      .padding()
      .background(Color.gray)
      .clipShape(Circle())
      .shadow(radius: 5)
      .overlay(Circle().stroke(Color.gray, lineWidth: 2))
      .padding(1)
  }
}
