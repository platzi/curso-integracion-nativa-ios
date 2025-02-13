//
//  CustomModifiers.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ReadingTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title3, design: .default, weight: .regular))
            .foregroundStyle(Color(uiColor: .secondaryLabel))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
    }
}

extension View {
    func readingTextStyle() -> some View {
        modifier(ReadingTextStyle())
    }
}
