import UIKit
@IBDesignable
class PushButton: UIButton {
    
    @IBInspectable var buttonColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true
    
    override func drawRect(rect: CGRect) {
        //Circle
        let path = UIBezierPath(ovalInRect: rect)
        buttonColor.setFill()
        path.fill()
        // Plus's Horizontal Line
        let plusPath = UIBezierPath()
        plusPath.lineWidth = 3.0
        
        let boundsWidth = CGRectGetWidth(bounds)
        let boundsHeight = CGRectGetHeight(bounds)
        let plusLength: CGFloat = min(boundsWidth, boundsHeight) * 0.6
        let yCoorinate = boundsHeight/2 + 0.5
        
        let leftPoint = CGPoint(x: boundsWidth/2 - plusLength/2, y: yCoorinate)
        plusPath.moveToPoint(leftPoint)
        let rightPoint = CGPoint(x: boundsWidth/2 + plusLength/2, y: yCoorinate)
        plusPath.addLineToPoint(rightPoint)
        UIColor.whiteColor().setStroke()
        plusPath.stroke()
        // Plus's Vertical Line
        if isAddButton {
            let xCoordinate = boundsHeight/2
            let topPoint = CGPoint(x: xCoordinate, y: boundsHeight/2 - plusLength/2)
            plusPath.moveToPoint(topPoint)
            let bottomPoint = CGPoint(x: xCoordinate, y: boundsHeight/2 + plusLength/2)
            plusPath.addLineToPoint(bottomPoint)
            plusPath.stroke()
        }
    }
}
