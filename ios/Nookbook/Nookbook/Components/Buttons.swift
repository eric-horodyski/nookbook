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


struct NBTabItem: View {
  var label: String
  var image: String
  
  var body: some View {
    Text(label)
    Image(image).renderingMode(.template)
  }
}
