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
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.").readingTextStyle()
                    Button("Ir al final") {
                        withAnimation {
                            scrollViewPosition.scrollTo(edge: .bottom)
                        }
                    }
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.").readingTextStyle()
                    
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it")
                        .padding(.vertical)
                        .onScrollVisibilityChange(threshold: 0.2){ bottomedOut in
                            withAnimation {
                                atTheBottom = bottomedOut
                            }
                        }
                    
                }
            }
            .padding(.horizontal)
        }
        .scrollPosition($scrollViewPosition)
        .onScrollGeometryChange(for: Bool.self) { geo in
            let topPadding: CGFloat = 100
            return abs(geo.contentOffset.y) >= (geo.contentInsets.top + topPadding)
        } action : { oldValue, newValue in
            withAnimation {
                showGoToTopButton = newValue
            }
        }
        .overlay {
            if showGoToTopButton {
                Button("Ir al inicio") {
                    withAnimation{
                        scrollViewPosition.scrollTo(edge: .top)
                    }
                }
                .buttonStyle(.borderedProminent)
                .offset(y: -350)
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Text(atTheBottom ? "Estamos en la parte inferior" : "Aun queda mas por leer")
                Spacer()
            }
            .padding(.vertical)
            .background(.ultraThinMaterial)
        }
        .navigationTitle("Scrollview Additions")
    }
}

#Preview {
    
}
