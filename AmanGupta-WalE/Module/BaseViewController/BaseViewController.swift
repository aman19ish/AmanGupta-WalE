//
//  BaseViewController.swift
//  AmanGupta-WalE
//
//  Created by Aman gupta on 10/04/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertWithHandlers(messageTitle: String = "Unkown", messageText: String?, actionLeftTitle: String = "Cancel", actionRightTitle: String = "ok", cancelCompletion: ((_ alert: UIAlertAction) -> Void)?, okCompletion: ((_ alert: UIAlertAction) -> Void)?) {
        
        let uiAlert = UIAlertController(title: messageTitle, message: messageText ?? "Unkown", preferredStyle: UIAlertController.Style.alert)
        uiAlert.addAction(UIAlertAction(title: actionLeftTitle, style: .default) { (alert) in
            cancelCompletion?(alert)
        })
        uiAlert.addAction(UIAlertAction(title: actionRightTitle, style: .default) { (alert) in
            okCompletion?(alert)
        })
        present(uiAlert, animated: true, completion: nil)
    }
    
}
