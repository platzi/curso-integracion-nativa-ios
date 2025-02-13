//
//  DemoTextEffectView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoTextEffectView: View {
    @State var bobbleText: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                GroupBox {
                    Toggle("Mostrar animación", isOn: $bobbleText.animation())
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(uiColor: .tertiarySystemGroupedBackground))
                        .frame(height: 140)
                    
                   
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Text Effect Example")
    }
}

struct WobbleText: View {
    @Binding var showText: Bool
    let text: String
    let duration: Double
    
    var body: some View {
        VStack {
            if showText {
                Text(text)
                    .customAttribute(EmphasisAttribute())
                    .transition(TextTransition(duration: duration))
            }
        }
    }
}

struct EmphasisAttribute: TextAttribute {}

struct AppearanceEffectRenderer: TextRenderer, Animatable {
    var elapsedTime: TimeInterval
    var elementDuration: TimeInterval
    var totalDuration: TimeInterval
    
    var spring: Spring {
        .snappy(duration: elementDuration - 0.05, extraBounce: 0.2)
    }
    
    var animatableData: Double {
        get { elapsedTime }
        set { elapsedTime = newValue }
    }
    
    init(elapsedTime: TimeInterval, elementDuration: Double = 0.4, totalDuration: TimeInterval) {
        self.elapsedTime = min(elapsedTime, totalDuration)
        self.elementDuration = min(elementDuration, totalDuration)
        self.totalDuration = totalDuration
    }
    
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for run in layout.flattenedRuns {
            if run[EmphasisAttribute.self] != nil {
                let delay = elementDelay(count: run.count)
                
                for (index, slice) in run.enumerated() {
                    let timeOffset = TimeInterval(index) * delay
                    let elementTime = max(0, min(elapsedTime - timeOffset, elementDuration))
                    var copy = context
                    draw(slice, at: elementTime, in: &copy)
                }
            } else {
                var copy = context
                copy.opacity = UnitCurve.easeIn.value(at: elapsedTime / 0.2)
                copy.draw(run)
            }
        }
    }
    
    func draw(_ slice: Text.Layout.RunSlice, at time: TimeInterval, in context: inout GraphicsContext) {
        let progress = time / elementDuration
        let opacity = UnitCurve.easeIn.value(at: 1.4 * progress)
        let invert =
        slice.typographicBounds.rect.height / 16 *
        UnitCurve.easeIn.value(at: 1 - progress)
        let translationY = spring.value(
            fromValue: -slice.typographicBounds.descent,
            toValue: 0,
            initialVelocity: 0,
            time: time)
        context.addFilter(.colorInvert(invert))
        context.opacity = opacity
        context.translateBy(x: 0, y: translationY)
        context.draw(slice, options: .disablesSubpixelQuantization)
    }
    
    func elementDelay(count: Int) -> TimeInterval {
        let count = TimeInterval(count)
        let remainingTime = totalDuration - count * elementDuration
        
        return max(remainingTime / (count + 1), (totalDuration - elementDuration) / count)
    }
}

extension Text.Layout {
    var flattenedRuns: some RandomAccessCollection<Text.Layout.Run> {
        self.flatMap { line in
            line
        }
    }
    
    var flattenedRunSlices: some RandomAccessCollection<Text.Layout.RunSlice> {
        flattenedRuns.flatMap(\.self)
    }
}

struct TextTransition: Transition {
    let duration: Double
    
    static var properties: TransitionProperties {
        TransitionProperties(hasMotion: true)
    }
    
    func body(content: Content, phase: TransitionPhase) -> some View {
        let duration = self.duration
        let elapsedTime = phase.isIdentity ? duration : 0
        let renderer = AppearanceEffectRenderer(
            elapsedTime: elapsedTime,
            totalDuration: duration
        )
        content.transaction { transaction in
            if !transaction.disablesAnimations {
                transaction.animation = .linear(duration: duration)
            }
        } body: { view in
            view.textRenderer(renderer)
        }
    }
}

#Preview {
}
