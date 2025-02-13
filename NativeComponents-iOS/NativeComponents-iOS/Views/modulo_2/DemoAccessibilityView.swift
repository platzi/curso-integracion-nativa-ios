//
//  DemoAccessibilityView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoAccessibilityView: View {
    @State private var colors: [Color] = Array(repeating: .blue, count: 9)
    @State private var labelColor: Color = .orange
    let buttons = [1, 2, 3, 6, 5, 4, 7, 8, 9]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    func changeLabelColor() { labelColor = labelColor == .orange ? .red : .orange }
    @AccessibilityFocusState(for: .voiceOver) private var isImageFocused
    
    var body: some View {
        VStack(spacing: 30) {
            ScrollView {
                VStack {
                    HStack {
                        Text("Orden de elementos")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.leading, 20)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                    }
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(buttons, id: \.self) { item in
                            Button("\(item)") {
                                colors[item - 1] = colors[item - 1] == .blue ? .red : .blue
                            }
                            .frame(width: 80, height: 50)
                            .background(item != 9 ? colors[item - 1] : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.system(size: 24))
                            .disabled(item == 9)
                            .accessibilityValue(colors[item - 1] == .red ? "Seleccionado" : "No Seleccionado")
                            .accessibilitySortPriority(Double(buttons.count - item))
                        }
                    }
                }
                
                VStack {
                    HStack {
                        Text("Movimiento de enfoque")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.leading, 20)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                    }
                    Button("Cambiar foco") {
                        isImageFocused.toggle()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    
                }
                
                VStack {
                    HStack {
                        Text("Acción personalizada")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.leading, 20)
                            .accessibilityAddTraits(.isHeader)
                        Spacer()
                    }
                    Text("Cambiar Color")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(labelColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .onTapGesture(count: 2) {
                        changeLabelColor()
                    }
                    .accessibilityAction {
                        changeLabelColor()
                    }
                    .accessibilityAction(named: "Accion de cambiar color") {
                        changeLabelColor()
                    }
                }
                
                VStack {
                    HStack {
                        Text("Anuncio")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.leading, 20)
                            .accessibilityAddTraits(.isHeader)
                        
                        Spacer()
                    }
                    Button("Hacer anuncio") {
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                }
                
                VStack {
                    HStack {
                        Text("Imagen enfocada")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.leading, 20)
                            .accessibilityAddTraits(.isHeader)

                        Spacer()
                    }
                    Image("deadpool")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .accessibilityFocused($isImageFocused)
                    
                }
            }
        }
    }
}

#Preview {
    DemoAccessibilityView()
}
