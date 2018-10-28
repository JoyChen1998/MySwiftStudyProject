//
//  EmotionsViewController.swift
//  Faceit
//
//  Created by JoyChan on 2018/10/28.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationVirewController = segue.destination
        if let navigationController = destinationVirewController as? UINavigationController{
            destinationVirewController = navigationController.visibleViewController ?? destinationVirewController
        }
        if let faceViewController = destinationVirewController as? FaceViewController ,
            let identifier = segue.identifier,
            let expression = emotionalFaces[identifier]{
                faceViewController.expression = expression
            faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }

    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "sad": FacialExpression(eyes: .closed, mouth: .frown),
        "happy": FacialExpression(eyes: .open, mouth: .smile),
        "worried": FacialExpression(eyes: .open, mouth: .frown)
        
    ]
}
