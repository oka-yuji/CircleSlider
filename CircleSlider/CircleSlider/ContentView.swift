//
//  ContentView.swift
//  CircleSlider
//
//  Created by 岡優志 on 2021/04/06.
//

import SwiftUI

struct ContentView: View {
    @State var myDouble: Double = 0.9
    var body: some View {
        VStack {
            Text("State\(myDouble)")
            Slider(value: $myDouble,
                   in: 0.00...1)
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3),
                            style: StrokeStyle(lineWidth: 20))
                    .frame(width: 120, height: 120)
                    .blendMode(.normal)
                Circle()
                    .trim(from: 0, to: CGFloat(myDouble))
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                    )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(
                        Angle(degrees: 180),
                        axis: (x: 1, y: 0, z: 0)
                        )
                    .frame(width: 120, height: 120)
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 10)
                    .animation(.easeInOut)
                
                Text("\(Int(myDouble * 100))%")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
