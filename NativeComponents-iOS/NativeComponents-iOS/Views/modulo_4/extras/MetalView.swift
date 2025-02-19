//
//  ConvertMetalToSwiftUI.swift
//  NativeComponents-iOS
//

import SwiftUI
import MetalKit

struct MetalView: UIViewRepresentable {
    func makeUIView(context: Context) -> MTKView {
        let mtkView = MTKView()
        if let device = MTLCreateSystemDefaultDevice() {
            mtkView.device = device
            mtkView.delegate = context.coordinator
            mtkView.clearColor = MTLClearColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        } else {
            fatalError("Dispositivo Metal no disponible")
        }
        return mtkView
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
            let library = try device.makeLibrary(source: shaderSource, options: nil)
            guard let vertexFunction = library.makeFunction(name: "vertex_main"), let fragmentFunction = library.makeFunction(name: "fragment_main")
            else {
                fatalError("Error al cargar funciones de Metal")
            }

            let pipelineDescriptor = MTLRenderPipelineDescriptor()
            pipelineDescriptor.vertexFunction = vertexFunction
            pipelineDescriptor.fragmentFunction = fragmentFunction
            pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm

            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch {
            fatalError("Error al crear el pipeline: \(error)")
        }
    }

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else {
            return
        }
    
        let commandBuffer = commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        renderCommandEncoder?.setRenderPipelineState(pipelineState)

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

        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawIndexedPrimitives(type: .triangle, indexCount: indices.count, indexType: MTLIndexType.uint16, indexBuffer: indexBuffer!, indexBufferOffset: 0)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
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
