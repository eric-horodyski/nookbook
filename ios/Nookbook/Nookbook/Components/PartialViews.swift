import SwiftUI

struct NBLoginBackground: View {
  var body: some View {
    VStack {
      Spacer()
      Image("LoginBackground")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.bottom, 30)
        .background(Color("WaterColor"))
    }
    .ignoresSafeArea()
    .background(Color("LoginBackgroundColor"))
  }
}

struct NBLogo: View {
  var body: some View {
    Image("Logo")
      .padding(.bottom, 20)
  }
}

struct NBError: View {
  var error: String
  var body: some View {
    Text(error)
      .font(.headline)
      .foregroundColor(Color.white)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Color("WarningColor"))
      .cornerRadius(8.0)
  }
}
