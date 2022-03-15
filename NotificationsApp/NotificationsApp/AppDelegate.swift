//
//  AppDelegate.swift
//  NotificationsApp
//
//  Created by Giovanni Madalozzo on 14/03/22.
//

import UIKit
import NotificationCenter

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{
    let notifications = NotificationManager()
    let action = Actions()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        notifications.requestAuth()
        notifications.notificationCenter.delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier{
        case "firstOption":
//            action.firstOption()
            NotificationCenter.default.post(name: Notification.Name("optionOne"), object: "Renan")
            print("Utilizado Notification Post")
            break
        case "secondOption":
//            action.secondOption()
            NotificationCenter.default.post(name: Notification.Name("optionTwo"), object: "Chumiga")
            print("Utilizado Notification Post")
            break
        case "thirdOption":
            action.thirdOption()
            print("Utilizado Protocol")
            break
        default:
            break
        }
        
        completionHandler()
    }
}


