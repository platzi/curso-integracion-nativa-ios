//
//  DemoVectorFunctionPlotView.swift
//  NativeComponents-iOS
//

import SwiftUI
import Charts

struct DemoVectorFunctionPlotView: View {
    var body: some View {
        VStack(spacing: 20) {
            ScrollView{
                Text("Gráfico 1: Curva Cuadrática (Y = X^2)")
                    .font(.headline)
                    .padding(.top, 30)
                Chart {
                    LinePlot(x: "X", y: "Y") { x in
                        pow(x, 2)
                    }
                }
                .chartXScale(domain: 1...10)
                .chartYScale(domain: 1...100)
                

                Text("Gráfico 2: Función Lineal (Y = 2X + 3)")
                    .font(.headline)
                    .padding(.top, 30)
                Chart {
                    LinePlot(x: "X", y: "Y") { x in
                        2 * x + 3
                    }
                }
                .chartXScale(domain: 1...10)
                .chartYScale(domain: 1...25)
                

                Text("Gráfico 3: Onda Senoidal (Y = sin(X))")
                    .font(.headline)
                    .padding(.top, 30)
                Chart {
                    LinePlot(x: "X", y: "Y") { x in
                        sin(x)
                    }
                }
                .chartXScale(domain: 0...100)
                .chartYScale(domain: -50...50)

                Text("Gráfico 4: Curva Exponencial (Y = 2^X)")
                    .font(.headline)
                    .padding(.top, 30)
                Chart {
                    LinePlot(x: "X", y: "Y") { x in
                        pow(2, x)
                    }
                }
                .chartXScale(domain: 1...8)
                .chartYScale(domain: 1...300)

                Text("Gráfico 5: Raíz Cuadrada (Y = √X)")
                    .font(.headline)
                    .padding(.top, 30)
                Chart {
                    LinePlot(x: "X", y: "Y") { x in
                        sqrt(x)
                    }
                }
                .chartXScale(domain: 1...100)
                .chartYScale(domain: 1...10)
            }
        }
        .padding()
        .navigationTitle("Múltiples Gráficos")
    }
}

#Preview {
}
