//
//  SaludoIntent.swift
//  NativeComponents-iOS
//

import AppIntents

struct SaludoIntent: AppIntent {
    static var title: LocalizedStringResource = "Saludar a alguien"
    @Parameter(title: "Nombre de la persona")
    var name: String

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let saludo = IntentDialog("Hola \(name)!")
        return .result(dialog: saludo)
    }
}
