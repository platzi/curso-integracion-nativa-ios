//
//  AuthDelegate.swift
//  NativeComponents-iOS
//

import AuthenticationServices

class AuthDelegate: NSObject, ASAuthorizationControllerDelegate {
    private var completion: (Result<Void, Error>) -> Void
  
   init(completion: @escaping (Result<Void, Error>) -> Void) {
       self.completion = completion
   }
  
   func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
       
       if let credential = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialAssertion {
           print("Autenticación exitosa")
           completion(.success(()))
       } else {
           completion(.failure(NSError(domain: "Passkeys", code: 1, userInfo: ([NSLocalizedDescriptionKey: "Credenciales incorrectas"]))))
       }
   }

   func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
       print("Error de autenticación: \(error.localizedDescription)")
       completion(.failure(error))
   }
}
