//
//  DemoKeychainView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoKeychainView: View {

    var body: some View {
        VStack(spacing: 20) {
            Text("Demo Keychain Manager")
                .font(.largeTitle)
                .padding()
            
            
            
            
            Button(action: {
           
                
                
            }) {
                Text("Guardar Token")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                
                
                
            }) {
                Text("Listar Tokens")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                
                
                
                
            }) {
                Text("Eliminar Todos los Tokens")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            
            
        }
        .padding()
    }
}

#Preview {
    DemoKeychainView()
}
