import UserNotifications
import UIKit

class NotificationManager {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuth(){
        notificationCenter.requestAuthorization(options: [.alert,.badge,.sound,]) { granted, error in
            if error != nil {
                print(error)
            }else{
                self.firstNotification()
            }
        }
    }
    func firstNotification(){
        let context = UNMutableNotificationContent()
        
        context.title = "HEY VOCÊ!"
        context.subtitle = "Selecione seu mentor dev!"
        context.body = "Sim, vai ter que descobrir quem é quem 🤠"
        context.sound = .default
        context.badge = 1
        
        let firstOptionAction = UNNotificationAction(identifier: "firstOption", title: "Opção 1", options: [])
        let secondOptionAction = UNNotificationAction(identifier: "secondOption", title: "Opção 2", options: [])
        let thirdOptionAction = UNNotificationAction(identifier: "thirdOption", title: "Opção 3", options: [])
        
        let actionIdentifier = "actionIdentifier"
        let category = UNNotificationCategory(identifier: actionIdentifier, actions: [firstOptionAction, secondOptionAction, thirdOptionAction], intentIdentifiers: [], options: [])
        notificationCenter.setNotificationCategories([category])
        context.categoryIdentifier = actionIdentifier
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let uuidString =  UUID().uuidString
        
        let requestNotification = UNNotificationRequest(identifier: uuidString, content: context, trigger: trigger)
        
        notificationCenter.add(requestNotification) { error in
            if error != nil{
                print(error)
            }
        }
    }
    
}
