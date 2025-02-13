//
//  DemoPassKey.swift
//  NativeComponents-iOS
//

import SwiftUI
import AuthenticationServices

struct DemoPasskeysAuthView: View {
    
    
   var body: some View {
       VStack(spacing: 20) {
           Text("")
               .font(.title)
               .padding()
          
           Button("") {
               Text("Iniciar sesión con Passkey")
                   .fontWeight(.bold)
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(10)
           }
       }
       .padding()
   }
  
   func authenticateUser() {
      
   }
}



#Preview {
    DemoPasskeysAuthView()
}
