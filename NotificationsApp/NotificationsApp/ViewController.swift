//
//  ViewController.swift
//  NotificationsApp
//
//  Created by Giovanni Madalozzo on 14/03/22.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {
    
    let actions = (UIApplication.shared.delegate as! AppDelegate).action
    @IBOutlet weak var mentorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        actions.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveLabel(_:)), name: Notification.Name("optionOne"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveLabel(_:)), name: Notification.Name("optionTwo"), object: nil)
    }

}
extension ViewController: ActionDelegate {
    
    func labelOption(label: String) {
        mentorLabel.text = label
    }
    
    @objc func receiveLabel(_ sender: Notification){
        mentorLabel.text = sender.object as? String ?? "Erro"
    }
}


