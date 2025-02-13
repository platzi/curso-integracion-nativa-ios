//
//  DemoAppleLoginView.swift
//  NativeComponents-iOS
//

import SwiftUI
import AuthenticationServices

struct DemoAppleLoginView: View {
    @State private var userIdentifierTemp: String = ""
    @State private var userEmail: String? = nil
    @State private var showSignInButton: Bool = true
    
    var body: some View {
        VStack {
            if showSignInButton {
                SignInWithAppleButton(
                    onRequest: { request in
                        request.requestedScopes = [.fullName, .email]
                    },
                    onCompletion: { result in
                        switch result {
                        case .success(let authResult):
                            handleAuthorizationSuccess(authResult: authResult)
                        case .failure(let error):
                            handleAuthorizationFailure(error: error)
                        }
                    }
                )
            } else {
                if let email = userEmail {
                    Text("Bienvenido \(email)")
                        .font(.title2)
                        .padding()
                } else {
                    Text("Autenticación exitosa")
                        .font(.title2)
                        .padding()
                        .padding()
                }
            }
            
        }
        .onAppear {
            checkCredentialsState()
        }
        .onReceive(NotificationCenter.default.publisher(for: ASAuthorizationAppleIDProvider.credentialRevokedNotification)) { _ in
            print("Las credenciales del usuario han sido revocadas")
            resetState()
        }
        
    }

    func handleAuthorizationSuccess(authResult: ASAuthorization) {
        if let appleIDCredential = authResult.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            userIdentifierTemp = userIdentifier
            userEmail = email ?? ""
            showSignInButton = false
        }
    }
    
    func handleAuthorizationFailure(error: Error) {
        print("Error de autenticación")
    }
    
    func checkCredentialsState() {
        let provider = ASAuthorizationAppleIDProvider()
        provider.getCredentialState(forUserID: userIdentifierTemp) { credentialState, error in
            if let error = error {
                print("Error al comprobar el estado de las credenciales")
                return
            }
            switch credentialState {
            case .authorized:
                print("Las credenciales del usuario están autorizadas")
            case .revoked:
                print("Las credenciales del usuario están revocadas")
                resetState()
            case .notFound:
                print("Las credenciales del usuario no se encontraron")
                resetState()
            default:
                break
            }
        }
    }
    
    func resetState() {
        userIdentifierTemp = ""
        userEmail = ""
        showSignInButton = true
    }
    
}
