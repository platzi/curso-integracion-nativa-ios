//
//  DemoPassKey.swift
//  NativeComponents-iOS
//

import SwiftUI
import AuthenticationServices

struct DemoPasskeysAuthView: View {
    @State private var authenticationStatus = "No autenticado"
    @State private var authDelegate: AuthDelegate?

   var body: some View {
       VStack(spacing: 20) {
           Text(authenticationStatus)
               .font(.title)
               .padding()
          
           Button(action: authenticateUser) {
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
       let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "com.platzi.NativeComponentsiOS")
       let request = publicKeyCredentialProvider.createCredentialAssertionRequest(challenge: Data("demo-challenge".utf8))
       
       let authController = ASAuthorizationController(authorizationRequests: [request])
       let delegate = AuthDelegate { result in
           switch result {
           case .success:
               authenticationStatus = "Autenticado correctamente"
           case .failure:
               authenticationStatus = "Error al autenticar"
           }
       }
       authDelegate = delegate
       authController.delegate = delegate
       authController.performRequests()
   }
}



#Preview {
    DemoPasskeysAuthView()
}
