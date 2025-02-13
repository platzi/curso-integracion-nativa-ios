//
//  ModuloOchoView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloOchoView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("SwiftData") {
                            DemoSwiftDataView()
                        }
                        NavigationLink("Keychain Services") {
                            DemoKeychainView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    
}
