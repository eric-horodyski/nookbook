import SwiftUI

struct NBEventCard: View {
  var event: Event
  var width: CGFloat
  
  let strokeColor: Color = Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1)
  
  var body: some View {
    VStack(spacing: 0) {
      Image("EventType")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: width, height: 48)
      HStack {
        VStack(alignment: .leading) {
          Text(event.type)
            .textCase(.uppercase)
            .font(.subheadline)
            .foregroundColor(Color("AccentColor"))
          Text(event.event)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
            .lineLimit(3)
          Spacer()
        }
        .layoutPriority(100)
        Spacer()
      }
      .padding()
      .background(.white)
    }
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(strokeColor, lineWidth: 1)
    )
    .frame(width: width, height: 150)
    .padding([.horizontal], 5)
  }
}
