//
//  CassiniViewController.swift
//  Cassini
//
//  Created by JoyChan on 2018/10/30.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    // MARK: - Navigation
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let url = DemoURL.NASA[segue.identifier ?? ""] {
            if let imageVC = (segue.destination as? ImageViewController) {
                imageVC.imageURL = url
                imageVC.title = (sender as? UIButton)?.currentTitle
            }
        }
        
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
        ) -> Bool {
        if primaryViewController.contents == self {
            if let ivc = secondaryViewController.contents as? ImageViewController, ivc.imageURL == nil{
                return true
            }
        }
        return false
    }

}

extension UIViewController {
    var contents : UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
