import SwiftUI

struct NBButtonStyle: ButtonStyle {
  let disabled: Bool?
  
  func makeBody(configuration: Self.Configuration) -> some View {
    let isEnabled = !(disabled ?? false)
    
    configuration
      .label
      .font(.headline)
      .foregroundColor(Color.white)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .allowsHitTesting(isEnabled)
      .background(isEnabled
                  ? Color("SecondaryColor").opacity(1.0)
                  : Color("SecondaryColor").opacity(0.6))
      .cornerRadius(8.0)
  }
}


