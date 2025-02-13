//
//  DemoKeychainView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoKeychainView: View {
    @State private var tokenStatus: String = "No hay token almacenado"
    @State private var inputToken: String = ""
    @State private var storedKeys: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("Demo Keychain Manager")
                .font(.largeTitle)
                .padding()
            TextField("Ingrese un token", text: $inputToken)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                let key = UUID().uuidString
                let isSaved = KeychainManager.shared.save(key: key, value: inputToken)
                if isSaved {
                    tokenStatus = "Token guardado correctamente"
                    storedKeys.append(key)
                } else {
                    tokenStatus = "Error al guardar token"
                }
                inputToken = ""
            }) {
                Text("Guardar Token")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                var allTokens = ""
                for key in storedKeys {
                    if let token = KeychainManager.shared.retrieve(key: key) {
                        allTokens += "\(key): \(token)\n"
                    }
                }
                tokenStatus = allTokens.isEmpty ? "No hay tokens almacenados" : "Tokens: \(allTokens)"
            }) {
                Text("Listar Tokens")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                var success = true
                for key in storedKeys {
                    if !KeychainManager.shared.delete(key: key) {
                        success = false
                    }
                }
                storedKeys.removeAll()
                tokenStatus = success ? "Todos los tokens fueron eliminados correctamente" : "Error al eliminar tokens"
            }) {
                Text("Eliminar Todos los Tokens")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Text(tokenStatus)
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        }
        .padding()
    }
}

#Preview {
    DemoKeychainView()
}
