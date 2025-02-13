//
//  DynamicIslandLiveActivity.swift
//  DynamicIsland
//

import ActivityKit
import WidgetKit
import SwiftUI

@main
struct DynamicIslandExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DeliveryAttributes.self) { context in
            HStack {
                Image(systemName: "truck.box.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .padding(.leading, 22)
                VStack(alignment: .leading) {
                    Text(context.state.productName)
                        .bold()
                    + Text(" está ")
                    + Text(context.state.deliveryStatus.rawValue)
                        .bold()
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Hora de entrega")
                    Text(context.state.eta)
                        .bold()
                }
                .padding(.trailing, 12)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "truck.box.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.white))
                        .padding(.leading, 12)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.productName)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("Estado \(context.state.deliveryStatus.rawValue)")
                        .bold()
                        .multilineTextAlignment(.center)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Button {
                        print("Pedido cancelado")
                    } label: {
                        Label("Cancelar pedido", systemImage: "xmark.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.red)
                }
            } compactLeading: {
                HStack {
                    Image(systemName: "truck.box.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                    Text(context.state.productName)
                }
            } compactTrailing: {
                Text(context.state.deliveryStatus.rawValue)
            } minimal: {
                Image(systemName: "truck.box.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
        }
    }
}
