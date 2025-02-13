//
//  ModuloCincoView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloCincoView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("HelthKit") {
                            DemoHealthKitView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloCincoView()
}
