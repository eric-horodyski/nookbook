import SwiftUI

struct NBHeading: View {
  var label: String
  
  var body: some View {
    Text(label)
      .foregroundColor(Color("PrimaryColor"))
      .font(.title3)
      .fontWeight(.bold)
      .padding()
  }
}

struct NBDateTime: View {
  let date: Date
  let dateFormatter: DateFormatter
  
  init() {
    self.date = Date()
    self.dateFormatter = DateFormatter()
    self.dateFormatter.dateStyle = .full
    self.dateFormatter.timeStyle = .short
  }
  
  var dateValue: String {
    return dateFormatter.string(from: date)
  }
  
  var body: some View {
    Text(dateValue).bold()
  }
}
