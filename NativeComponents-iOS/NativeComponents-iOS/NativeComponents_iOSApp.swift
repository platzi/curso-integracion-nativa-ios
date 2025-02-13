//
//  NativeComponents_iOSApp.swift
//  NativeComponents-iOS
//

import SwiftUI

@main
struct NativeComponents_iOSApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Item.self)
    }
}
