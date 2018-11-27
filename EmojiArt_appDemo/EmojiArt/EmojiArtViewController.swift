//
//  EmojiArtViewController.swift
//  EmojiArt
//
//  Created by JoyChan on 2018/11/27.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

class EmojiArtViewController: UIViewController, UIDropInteractionDelegate {

    @IBOutlet weak var dropZone: UIView!{
        didSet {
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
        
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSURL.self) { (nsurls) in
            
        }
        session.loadObjects(ofClass: UIImage.self) { (images) in
            
        }
    }
    
    
    @IBOutlet weak var emojiArtView: EmojiArtView!
    
   

}
