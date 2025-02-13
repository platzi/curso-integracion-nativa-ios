//
//  ModuloUnoView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloUnoView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("Scrollview Additions") {
                            DemoScrollView()
                        }
                        NavigationLink("Zoom Transitions") {
                            DemoZoomView()
                        }
                        NavigationLink("SF Symbol Updates") {
                            DemoSFSymbolView()
                        }
                        NavigationLink("Geometry Changes") {
                            DemoGeoChangeView()
                        }
                        NavigationLink("Color Blending") {
                            DemoColorBlendView()
                        }
                        NavigationLink("Text Effects") {
                            DemoTextEffectView()
                        }
                        NavigationLink("Mesh Gradients") {
                            DemoMeshGradientView()
                        }
                        NavigationLink("Vectorial Function Plot") {
                            DemoVectorFunctionPlotView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloUnoView()
}
