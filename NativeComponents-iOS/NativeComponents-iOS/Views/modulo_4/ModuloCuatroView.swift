//
//  ModuloCuatroView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloCuatroView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("Metal") {
                            DemoMetalView()
                        }
                        NavigationLink("Sensores") {
                            DemoSensoresView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloCuatroView()
}
