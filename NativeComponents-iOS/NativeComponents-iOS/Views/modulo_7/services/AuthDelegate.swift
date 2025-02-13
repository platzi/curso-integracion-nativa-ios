//
//  AuthDelegate.swift
//  NativeComponents-iOS
//

import AuthenticationServices

class AuthDelegate: NSObject, ASAuthorizationControllerDelegate {

    
   init(completion: @escaping (Result<Void, Error>) -> Void) {
    
   }
  
   func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
       
       if let credential = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialAssertion {
           
           
       } else {

       }
   }

    
   func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
       
       
   }
}
