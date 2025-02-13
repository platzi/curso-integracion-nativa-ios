//
//  DemoUIKitSwiftUIView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoUIKitSwiftUIView: View {
    var body: some View {
            VStack(spacing: 20) {
                ScrollView {
                    UIKitLabel(
                        text: "Hola desde UIKit!",
                        textColor: .blue,
                        fontSize: 30
                    ).frame(height: 50)
                    UIKitImage(
                        imageName: "deadpool"
                    )
                    Spacer()
                    Text("Esto es un texto nativo en SwiftUI")
                        .font(.title)
                        .foregroundColor(.red)
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.yellow)
                }
            }
            .padding()
        }
}

#Preview {
    DemoUIKitSwiftUIView()
}
