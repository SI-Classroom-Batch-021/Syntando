//
//  OnBoarding_NotificationRequest.swift
//  Batch21LiefrandoLogin
//
//  Created by Till Hemmerich on 18.12.24.
//

import SwiftUI
import UserNotifications

struct OnBoarding_NotificationRequest: View {
    var body: some View {
        ZStack{
            Color.orange
            VStack{
                Image(systemName: "bubble.left.and.exclamationmark.bubble.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .padding(.bottom,40)
                
                Text("label.notification_request")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                
                SyntandoButton(text: "button.activate_notifications", active: true) {
                    Task{
                        await NotificationManager.shared.askForNotificationPermission()
                    }
                }
                .padding(.horizontal,16)
                .padding(.top,40)
                SyntandoButton(text: "button.test_notifications", active: true) {

                    let notificationContent = NotificationManager.shared.createNotificationContent(
                        title: "Das ist eine Test Notification",
                        body: "Super das du dich für unsere Nachrichten interessiert.",
                        sound: .default)
                    let notificationTrigger = NotificationManager.shared.createNotificationTrigger(
                        timeInterval: 5,
                        repeats: false)
                   
                    NotificationManager.shared.createNotification(content: notificationContent, trigger: notificationTrigger)
                }
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    OnBoarding_NotificationRequest()
}
