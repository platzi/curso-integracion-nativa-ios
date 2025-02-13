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
                    
                    
                    
                    Text("Sin reemplazo mágico:")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                   
                    
                }
                
                Group {
                    GroupBox {
                        Toggle("Meneo/Movimiento", isOn: $wiggle)
                        
                        
                    }
                    GroupBox {
                        Toggle("Meneo/Movimiento", isOn: $wiggle)
                        HStack {
                            
                            
                        }
                    }
                    .padding(.bottom, 16)
                   
                    GroupBox {
                        Toggle("Rotación", isOn: $rotate)
                        
                        
                    }
                    Group {
                        GroupBox {
                            Toggle("Efecto respira", isOn: $breathe)
                            
                            
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
