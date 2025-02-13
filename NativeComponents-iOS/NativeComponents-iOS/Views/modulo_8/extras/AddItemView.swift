//
//  AddItemView.swift
//  NativeComponents-iOS
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var done = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre del ToDo", text: $title)
            }
            .navigationTitle("Nuevo elemento")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    dismiss()
                },
                trailing: Button("Añadir") {
                    let newItem = Item(title: title, done: done)
                    context.insert(newItem)
                    do {
                        try context.save()
                        dismiss()
                    } catch {
                        print("Error al guardar datos")
                    }
                }
                .disabled(title.isEmpty)
            )
            
        }
    }
}

#Preview {
    AddItemView()
}
