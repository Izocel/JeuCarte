import SwiftUI
struct BtnPrincipalStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .background(
        Color.red.opacity(configuration.isPressed ? 0.5 : 1)
      )
      .foregroundColor(.white)
      .cornerRadius(8)
  }
}

