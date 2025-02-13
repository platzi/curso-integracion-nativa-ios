//
//  DemoDynamicIslandView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoDynamicIslandView: View {
    @State var productName = "Libro de SwiftUI - $29.99"
    @State var currentDeveliverState: DeliveryStatus = .pending
    @State var activityId = ""
    
    var body: some View {
        VStack {
            Text(productName)
                .font(.system(size: 28, weight: .bold))
                .padding(.bottom, 32)
            Image(systemName: "book")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Estado del pedido: \(currentDeveliverState.rawValue)")
                .font(.system(.body))
            Button {
                buyProduct()
            } label: {
                Label("Comprar", systemImage: "cart.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .padding()
            .frame(maxWidth: .infinity)
            
            Button {
                changeState()
            } label: {
                Label("Cambiar estado de producto", systemImage: "arrow.clockwise.circle.fill")
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .padding()
            .frame(maxWidth: .infinity)
            
            Button {
                removeState()
            } label: {
                Label("Eliminar producto", systemImage: "trash")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding()
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding()
    }
    
    private func buyProduct() {
        currentDeveliverState = .sent
        do {
            activityId = try DeliveryActivityUseCase.startActivity(
                deliveryStatus: currentDeveliverState,
                productName: productName,
                eta: "15:00 pm"
                )
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func changeState() {
        currentDeveliverState = .inTransit
        Task {
            await DeliveryActivityUseCase.updateActivity(
                activityId: activityId,
                newDeliveryStatus: currentDeveliverState,
                productName: productName,
                eta: "1500")
        }
    }
    
    private func removeState() {
        currentDeveliverState = .deliviered
        Task {
            await DeliveryActivityUseCase.endActivity(activityId: activityId)
        }
    }
}

#Preview {
    DemoDynamicIslandView()
}
