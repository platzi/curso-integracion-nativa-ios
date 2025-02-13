//
//  MultiplyNumbersIntent.swift
//  NativeComponents-iOS
//

import AppIntents

struct MultiplyNumbersIntent: AppIntent {
    static var title: LocalizedStringResource = "Multiplicar dos números"
    
    @Parameter(title: "Primer parámetro")
    var firstNumber: Double
    
    @Parameter(title: "Segundo parámetro")
    var secondNumber: Double
    
    func perform() async throws -> some IntentResult & ReturnsValue<Double> & ProvidesDialog {
        let result = firstNumber * secondNumber
        return .result(
            value: result, dialog: "El resultado de \(String(format: "%.0f", firstNumber)) x \(String(format: "%.0f", secondNumber)) es \(String(format: "%.0f", result))"
        )
    }
}
