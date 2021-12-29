import SwiftUI

struct NBTextField: View {
  var label: String
  @Binding var value: String
  
  var body: some View {
    return TextField(label, text: $value)
      .padding()
      .background(Color.white)
      .cornerRadius(8.0)
      .padding(.bottom, 10)
  }
}

struct NBEmailField: View {
  @Binding var email: String
  var body: some View {
    return NBTextField(label: "Email Address", value: $email)
      .keyboardType(.emailAddress)
      .disableAutocorrection(true)
      .textInputAutocapitalization(.never)
  }
}

struct NBPasswordField: View {
  var label: String
  @Binding var password: String
  var body: some View {
    return SecureField(label, text: $password)
      .padding()
      .background(Color.white)
      .cornerRadius(5.0)
      .padding(.bottom, 10)
  }
}
