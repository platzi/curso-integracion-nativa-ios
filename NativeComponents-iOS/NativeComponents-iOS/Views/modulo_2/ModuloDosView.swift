//
//  ModuloDosView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloDosView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("Widgets") {
                            DemoWidgetsView()
                        }
                        NavigationLink("Dynamic Island") {
                            DemoDynamicIslandView()
                        }
                        NavigationLink("Accessibility") {
                            DemoAccessibilityView()
                        }
                        NavigationLink("UIKit en SwiftUI") {
                            DemoUIKitSwiftUIView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloDosView()
}
