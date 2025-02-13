//
//  DemoNotificacionesView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoNotificationsView: View {
    var body: some View {
        VStack {
            Text("Notificaciones en SwiftUI")
                .font(.largeTitle)
                .padding()
            Button(action:
                    NotificationManager.shared.requestPermission
            ) {
                Text("Solicitar permiso")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            Button(action:
                    NotificationManager.shared.scheduleNotification
            ) {
                Text("Programar notificación")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    DemoNotificationsView()
}
