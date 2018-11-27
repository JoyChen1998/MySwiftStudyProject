//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by JoyChan on 2018/11/27.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backgroundImage : UIImage? { didSet { setNeedsDisplay() }}
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        backgroundImage?.draw(in: bounds)
    }
 

}
