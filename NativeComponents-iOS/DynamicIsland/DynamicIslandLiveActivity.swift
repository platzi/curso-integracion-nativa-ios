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
                    
                }
                DynamicIslandExpandedRegion(.trailing) {
                    
                }
                DynamicIslandExpandedRegion(.center) {
                    
                }
                DynamicIslandExpandedRegion(.bottom) {
                    
                }
            } compactLeading: {
                
            } compactTrailing: {

            } minimal: {
                
            }
        }
    }
}
