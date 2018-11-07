//
//  FaceView.swift
//  Faceit
//
//  Created by Joychan on 2018/10/25.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {

    private var skullRadius : CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    private var skullCenter : CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    @IBInspectable
    var scale : CGFloat = 0.9 {didSet {setNeedsDisplay()}}
    @IBInspectable
    var eyesOpen: Bool = true {didSet {setNeedsDisplay()}}
    @IBInspectable
    var mouthCurvature: Double =  -1.0 {didSet {setNeedsDisplay()}}
    // for full smile . And -1.0 is for full frown
    @IBInspectable
    var lineWidth:CGFloat = 5.0 {didSet {setNeedsDisplay()}}
    @IBInspectable
    var color:UIColor = UIColor.blue {didSet {setNeedsDisplay()}}
    
@objc   func changeScale(byReactingTo pinchRecognizer: UIPinchGestureRecognizer) {
        switch pinchRecognizer.state {
        case .changed, .ended:
                scale *= pinchRecognizer.scale
                pinchRecognizer.scale = 1
        default:
            break
        }
    }
    
    private enum Eye{
        case left
        case right
    }
    
    private func pathforEye(_ eye:Eye) -> UIBezierPath {
        func centerOfEye(_ eye:Eye)->CGPoint {
            let eyeOffset  = skullRadius / Ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        let eyeCenter = centerOfEye(eye)
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeOffset * 0.5
        let path : UIBezierPath
        if eyesOpen{
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        }else{
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
        }
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathforSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false)
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathforMouth() -> UIBezierPath{
        let mouthWidth = skullRadius / Ratios.skullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.skullRadiusToMouthHeight
        let mouthOffset = skullRadius / Ratios.skullRadiusToMouthOffset
        let mouthRect = CGRect(
            x: skullCenter.x - mouthWidth/2
            , y: skullCenter.y + mouthOffset
            , width: mouthWidth
            , height: mouthHeight
        )
        let smileOffset = CGFloat(max(-1, min(mouthCurvature,1))) * mouthRect.height
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.midY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.midY)
        
        let op1 = CGPoint(x: start.x + mouthRect.height/3, y: start.y - smileOffset)
        let op2 = CGPoint(x: end.x - mouthRect.height/3, y: start.y - smileOffset)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: op1, controlPoint2: op2)
        
        path.lineWidth = lineWidth
        return path
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        pathforSkull().stroke()
        pathforEye(.left).stroke()
        pathforEye(.right).stroke()
        pathforMouth().stroke()
    }
    
    private struct Ratios {
        static let skullRadiusToEyeOffset : CGFloat = 3
        static let skullRadiusToEyeRadius : CGFloat = 8
        static let skullRadiusToMouthWidth : CGFloat = 1
        static let skullRadiusToMouthHeight : CGFloat = 3
        static let skullRadiusToMouthOffset : CGFloat = 3
    }
}
