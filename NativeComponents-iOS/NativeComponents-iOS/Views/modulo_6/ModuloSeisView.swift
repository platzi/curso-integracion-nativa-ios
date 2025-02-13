//
//  ModuloSeisView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloSeisView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("MapKit") {
                            DemoMapKit()
                        }
                        NavigationLink("Localization") {
                            DemoLocalization()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloSeisView()
}
