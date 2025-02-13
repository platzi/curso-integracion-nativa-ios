//
//  ConvertMetalToSwiftUI.swift
//  NativeComponents-iOS
//

import SwiftUI
import MetalKit

struct MetalView: UIViewRepresentable {
    func makeUIView(context: Context) -> MTKView {
        return MTKView()
    }

    func updateUIView(_ uiView: MTKView, context: Context) {
        
    }

    func makeCoordinator() -> Renderer {
        Renderer()
    }
}

class Renderer: NSObject, MTKViewDelegate {
    private var device: MTLDevice!
    private var commandQueue: MTLCommandQueue!
    private var pipelineState: MTLRenderPipelineState!

    override init() {
        super.init()

        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Dispositivo Metal no disponible")
        }

        self.device = device
        self.commandQueue = device.makeCommandQueue()

        do {
            
            
            
            

            

            
        } catch {
            fatalError("Error al crear el pipeline: \(error)")
        }
    }

    func draw(in view: MTKView) {
        
        
        
        

        let vertices: [Float] = [
           -0.5,  0.5, 0.0,
           -0.5, -0.5, 0.0,
            0.5, -0.5, 0.0,
            0.5,  0.5, 0.0
        ]

        let indices: [UInt16] = [
            0, 1, 2,
            0, 2, 3
        ]

        let vertexBuffer = device.makeBuffer(bytes: vertices, length: MemoryLayout<Float>.size * vertices.count, options: [])
        let indexBuffer = device.makeBuffer(bytes: indices, length: MemoryLayout<UInt16>.size * indices.count, options: [])

        
        
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {

    }
}

let shaderSource = """
#include <metal_stdlib>
using namespace metal;
vertex float4 vertex_main(const device float3 *vertices [[buffer(0)]], unsigned int vid [[vertex_id]]) {
    return float4(vertices[vid], 1.0);
}
fragment float4 fragment_main() {
    return float4(0.0, 1.0, 1.0, 1.0);
}
"""
