//
//  DemoGalleryView.swift
//  NativeComponents-iOS
//

import SwiftUI
import PhotosUI

struct DemoGalleryView: View {
    @State private var selectedPhotos: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            Form {
                photoPickerSection
                imagesSection
            }
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
    
    private var photoPickerSection: some View {
        Section {
            PhotosPicker(
                selection: $selectedPhotos,
                maxSelectionCount: 5,
                matching: .images
            ) {
                Label("Seleccionar imágenes de la galeria", systemImage: "photo")
            }
            .onChange(of: selectedPhotos) {
                loadSelectedPhotos()
            }
        }
    }
    
    private var imagesSection: some View {
        Section {
            ForEach(images, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.vertical, 10)
            }
        }
    }
    
    private func loadSelectedPhotos() {
        images.removeAll()
        errorMessage = nil
        
        Task {
            await withTaskGroup(of: (UIImage?, Error?).self) { taskGroup in
                for photoItem in selectedPhotos {
                    taskGroup.addTask {
                        do {
                            if let imageData = try await photoItem.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                                return (image, nil)
                            }
                            return (nil, nil)
                        } catch {
                            return (nil, error)
                        }
                    }
                }
                for await result in taskGroup {
                    if result.1 != nil {
                        errorMessage = "Fallo en obtener una o más imágenes"
                        break
                    } else if let image = result.0 {
                        images.append(image)
                    }
                }
            }
        }
    }
}

#Preview {
    DemoGalleryView()
}
