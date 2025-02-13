//
//  DemoSwiftDataView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoSwiftDataView: View {
    
      
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("ToDos")
                        .font(.largeTitle)
                        .padding(.leading, 20)
                    Spacer()
                    Button {


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
                    
                    
                    
                    
                }
            }
            
            
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
