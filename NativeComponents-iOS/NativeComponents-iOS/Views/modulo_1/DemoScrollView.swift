//
//  DemoScrollView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoScrollView: View {
    @State private var showGoToTopButton: Bool = false
    @State private var scrollViewPosition: ScrollPosition = .init(idType: Int.self)
    @State private var atTheBottom: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    
                }
            }
            .padding(.horizontal)
        }
        
        .navigationTitle("Scrollview Additions")
    }
}

#Preview {
    
}
