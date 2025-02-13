//
//  DemoSwiftDataView.swift
//  NativeComponents-iOS
//

import SwiftUI
import SwiftData

struct DemoSwiftDataView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Item.title) private var items: [Item]
    @State private var showingAddSheet = false
        
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("ToDos")
                        .font(.largeTitle)
                        .padding(.leading, 20)
                    Spacer()
                    Button {
                        showingAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 22))
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 60)
                .padding(.bottom, 10)
                
                List {
                    ForEach(items) { item in
                        Toggle(item.title, isOn:
                                Binding(
                                    get: { item.done },
                                    set: {
                                        newValue in
                                        item.done = newValue
                                        do {
                                            try context.save()
                                        } catch {
                                            print("Error al guardar datos")
                                        }
                                    }
                                )
                        )
                        .toggleStyle(CheckboxToggleStyle())
                        .frame(height: 60)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                context.delete(item)
                                do {
                                    try context.save()
                                } catch {
                                    print("Error al eliminar datos")
                                }
                            } label: {
                                Label("Borrar", systemImage: "trash")
                            }
                        }
                    }
                    
                    
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            AddItemView()
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    @State private var isPressed = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            
            if configuration.isOn {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
                    .font(.system(size: 20))
            }
        }
        .frame(height: 60)
        .background(isPressed ? Color.gray.opacity(0.2) : Color.clear)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        isPressed = false
                    }
                }
                configuration.isOn.toggle()
            }
        }
    }
}
#Preview {
    
}
