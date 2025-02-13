//
//  DemoDynamicIslandView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoDynamicIslandView: View {
    
    
    
    var body: some View {
        VStack {
            Text("")
                .font(.system(size: 28, weight: .bold))
                .padding(.bottom, 32)
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Estado del pedido: ")
                .font(.system(.body))
            Button {
                buyProduct()
            } label: {
                Label("Comprar", systemImage: "cart.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .padding()
            .frame(maxWidth: .infinity)
            
            Button {
                changeState()
            } label: {
                Label("Cambiar estado de producto", systemImage: "arrow.clockwise.circle.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .padding()
            .frame(maxWidth: .infinity)
            
            Button {
                removeState()
            } label: {
                Label("Eliminar producto", systemImage: "trash")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding()
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding()
    }
    
    private func buyProduct() {
        
    }
    
    private func changeState() {
        
    }
    
    private func removeState() {
        
    }
}

#Preview {
    DemoDynamicIslandView()
}
