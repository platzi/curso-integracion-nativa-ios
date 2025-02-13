//
//  DemoSFSymbol.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoSFSymbolView: View {
    @State private var showSmartReplace: Bool = false
    @State private var wiggle = false
    @State private var rotate = false
    @State private var breathe = false
    
    var body: some View {
        ScrollView {
            VStack {
                GroupBox {
                    Toggle("Toggle", isOn: $showSmartReplace.animation())
                    Text("Con reemplazo mágico:")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Image(systemName: showSmartReplace ? "pencil.slash": "pencil")
                        .contentTransition(.symbolEffect)
                        .font(.largeTitle)
                        .padding(.vertical, 16)
                    
                    Text("Sin reemplazo mágico:")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Image(systemName: showSmartReplace ? "pencil.slash": "pencil")
                        .font(.largeTitle)
                        .padding(.vertical, 16)
                }
                
                Group {
                    GroupBox {
                        Toggle("Meneo/Movimiento", isOn: $wiggle)
                        Image(systemName: "key.2.on.ring.fill")
                            .symbolEffect(.wiggle, value: wiggle)
                            .font(.largeTitle)
                            .padding(.vertical, 16)
                    }
                    GroupBox {
                        Toggle("Meneo/Movimiento", isOn: $wiggle)
                        HStack {
                            Image(systemName: "key.2.on.ring.fill")
                                .symbolEffect(.wiggle.up, value: wiggle)
                                .font(.largeTitle)
                                .padding(.vertical, 16)
                            Image(systemName: "key.2.on.ring.fill")
                                .symbolEffect(.wiggle.byLayer, value: wiggle)
                                .font(.largeTitle)
                                .padding(.vertical, 16)
                            Image(systemName: "key.2.on.ring.fill")
                                .symbolEffect(.wiggle.backward, value: wiggle)
                                .font(.largeTitle)
                                .padding(.vertical, 16)
                            
                        }
                    }
                    .padding(.bottom, 16)
                   
                    GroupBox {
                        Toggle("Rotación", isOn: $rotate)
                        Image(systemName: "steeringwheel.and.hands")
                            .symbolEffect(.rotate, value: rotate)
                            .font(.largeTitle)
                            .padding(.vertical, 16)
                    }
                    Group {
                        GroupBox {
                            Toggle("Efecto respira", isOn: $breathe)
                            Image(systemName: "lungs.fill")
                                .foregroundStyle(Color.pink)
                                .symbolEffect(.breathe, options: .repeat(.continuous), value: breathe)
                                .font(.largeTitle)
                                .padding(.vertical, 16)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("SF Symbol Examples")
    }
}

#Preview {
    
}
