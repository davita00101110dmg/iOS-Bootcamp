//
//  LocalNotificationsHelper.swift
//  DavitiKhvedelidzeHW25
//
//  Created by Dato Khvedelidze on 27.08.22.
//

import UIKit
import UserNotifications

struct LocalNotification {
    let id: String
    let title: String
    let message: String
}

struct LocalNotificationManager {
    
    static func register(notification: LocalNotification, duration: Int, repeats: Bool, userInfo: [AnyHashable: Any]) {
        let userNotification = UNUserNotificationCenter.current()
        
        // Get permission
        userNotification.requestAuthorization(options: [.badge, .alert, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    addNotification(notification: notification, duration: duration, repeats: repeats, userInfo: userInfo)
                }
            }
        }
        
    }
    
    static func addNotification(notification: LocalNotification, duration: Int, repeats: Bool, userInfo: [AnyHashable: Any]) {
        
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.message
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.userInfo = userInfo
        
        let uuidString = UUID().uuidString
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: repeats)
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { error in
            guard error != nil else { return }
        }
    }
}
