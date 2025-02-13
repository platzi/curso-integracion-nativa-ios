//
//  DemoAuthFaceIDView.swift
//  NativeComponents-iOS
//

import SwiftUI
import LocalAuthentication

struct DemoAuthFaceIDView: View {
    @State private var authenticationStatus = "No autenticado"
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(authenticationStatus)
                .font(.title)
                .padding()
            
            Button(
                action: authenticateUser
            ) {
                Text("Autenticar con FaceID")
                    .fontWeight(.bold)
                    .padding()
                    .background(isAuthenticated ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Autentícate para acceder a funciones seguras"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        authenticationStatus = "Autenticado con FaceID"
                        isAuthenticated = true
                    } else {
                        authenticationStatus = "No autenticado con FaceID \(authenticationError?.localizedDescription ?? "Error desconocido")"
                        isAuthenticated = false
                    }
                }
            }
        } else {
            authenticationStatus = "No se puede autenticar con FaceID"
            isAuthenticated = false
        }
    }
    
}

#Preview {
    DemoAuthFaceIDView()
}
