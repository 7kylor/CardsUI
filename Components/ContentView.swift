
import SwiftUI

struct CardView: View {
    var scale: CGFloat
    var gradient: Gradient
    @State private var isPressed = false

    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
            .frame(width: (isPressed ? 280 : 300) * scale, height: (isPressed ? 280 : 300) * scale)
            .cornerRadius(32)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.easeInOut)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                isPressed = pressing
            }, perform: {})
    }
}

struct ContentView: View {
    var body: some View {
        Spacer()
        ZStack {
            CardView(scale: 0.8, gradient: Gradient(colors: [Color.red, Color.orange])).offset(x: 0, y: 80)
            CardView(scale: 0.9, gradient: Gradient(colors: [Color.green, Color.yellow])).offset(x: 0, y: 40)
            CardView(scale: 1.0, gradient: Gradient(colors: [Color.red, Color.purple]))
        }.offset(x: 0, y: -90)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}