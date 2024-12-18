//
//  NotificationManager.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 18.12.24.
//

import Foundation
import UserNotifications

class NotificationManager{
    
    static let shared = NotificationManager()
    
    let center = UNUserNotificationCenter.current()
    var error : String = ""
    
    private init(){
        
    }
    
    func askForNotificationPermission() async{
        do{
            try await center.requestAuthorization(options: [.alert, .badge, .sound])
        }catch{
            self.error = error.localizedDescription
        }
    }
    func createNotification(content: UNMutableNotificationContent, trigger: UNNotificationTrigger){
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request){ error in
            if let error {
                print("ERROR :\(error.localizedDescription)")
            }
            
        }
    }
    func createNotificationContent(title: String, body: String, sound: UNNotificationSound) -> UNMutableNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = sound
        return content
    }
    func createNotificationTrigger(timeInterval: TimeInterval, repeats: Bool) -> UNNotificationTrigger{
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        return trigger
    }
}


    
