//
//  MyAppShortcuts.swift
//  NativeComponents-iOS
//

import AppIntents

struct MyAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        return [
            AppShortcut(
                intent: SaludoIntent(),
                phrases: [
                    "Saludar a \(\.$name)"
                ],
                shortTitle: "Saludar",
                systemImageName: "hand.wave"
            ),
            AppShortcut(
                intent: MultiplyNumbersIntent(),
                phrases: [
                    "Multiplicar número \(\.$firstNumber)"
                ],
                shortTitle: "Multiplicar",
                systemImageName: "multiply.circle"
            ),
        ]
    }
}
