//
//  NotificationManager.swift
//  NativeComponents-iOS
//
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error al solicitar permiso")
            } else {
                print(granted ? "Permiso concedido" : "Permiso denegado")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hola desde mi aplicación"
        content.body = "Este es el contenido de mi notificación para el curso de iOS"
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al programar la notificacion")
            } else {
                print("Notificacion programada con éxito")
            }
        }
    }
    
}
