//
//  NotificationHandler.swift
//  MineCharts
//
//  Created by Yan Rybkin on 10.06.2023.
//

import Foundation
import UserNotifications

final class NotificationHandler {
    
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func sendNotification(
        date: Date,
        type: String,
        timeInterval: Double = 10,
        title: String,
        body: String
    ) {
        let trigger = createNotificationTrigger(date: date, type: type, timeInterval: timeInterval)
        let content = createNotificationContent(title: title, body: body)
        let request = createNotificationRequest(content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

private extension NotificationHandler {
    func createNotificationTrigger(
        date: Date,
        type: String,
        timeInterval: Double
    ) -> UNNotificationTrigger? {
        switch type {
        case "date":
            let dateComponents = Calendar.current.dateComponents(
                [.day, .month, .year, .hour, .minute],
                from: date
            )
            return UNCalendarNotificationTrigger(
                dateMatching: dateComponents,
                repeats: false
            )
        case "time":
            return UNTimeIntervalNotificationTrigger(
                timeInterval: timeInterval,
                repeats: false
            )
        default:
            return nil
        }
    }
    
    func createNotificationContent(
        title: String,
        body: String
    ) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        return content
    }
    
    func createNotificationRequest(
        content: UNMutableNotificationContent,
        trigger: UNNotificationTrigger?
    ) -> UNNotificationRequest {
        return UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
    }
}
