//
//  ModuloSieteView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloSieteView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("Notificaciones") {
                            DemoNotificationsView()
                        }
                        NavigationLink("Autenticación Passkey") {
                            DemoPasskeysAuthView()
                        }
                        NavigationLink("Autenticación FaceID") {
                            DemoAuthFaceIDView()
                        }
                        NavigationLink("Apple Login") {
                            DemoAppleLoginView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloSieteView()
}
