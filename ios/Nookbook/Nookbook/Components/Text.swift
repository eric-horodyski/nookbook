import SwiftUI

struct NBHeading: View {
  var label: String
  
  var body: some View {
    Text(label)
      .foregroundColor(Color("PrimaryColor"))
      .font(.title)
      .fontWeight(.semibold)
      .padding(10)
  }
}
