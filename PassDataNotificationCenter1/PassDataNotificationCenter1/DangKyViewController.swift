//
//  ViewController.swift
//  PassDataNotificationCenter1
//
//  Created by duycuong on 11/14/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let dataText = Notification.Name("key")
}

class DangKyViewController: UIViewController {
    
    // Kien cung
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(dangKy(notification:)), name: .dataText, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "push":
            if let vc = segue.destination as? PhatViewController {
                title = ""
                vc.title = "Phát thông báo"
                navigationController?.pushViewController(vc, animated: false)
            }
            
        default:
            break
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

    @objc func dangKy(notification: NSNotification) {
        nameLabel.text = notification.object as? String
    }
    
}

