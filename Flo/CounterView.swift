import UIKit

let NoOfGlasses = 8
let π = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        let boundsWidth = CGRectGetWidth(bounds)
        let boundsHeight = CGRectGetHeight(bounds)
        let midX = CGRectGetMidX(bounds)
        let midY = CGRectGetMidY(bounds)
        let centerPoint = CGPoint(x: midX, y: midY)
        let diameter: CGFloat = max(boundsWidth, boundsHeight)
        let arcWidth: CGFloat = 76
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        // Arc
        let path = UIBezierPath(arcCenter: centerPoint, radius: diameter/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        // Outline
        let totalAngleLengthOfThePath: CGFloat = 2 * π - startAngle + endAngle
        let arcLengthPerGlass = totalAngleLengthOfThePath / CGFloat(NoOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        let outlineHalfWidth: CGFloat = 2.5
        let outlinePath = UIBezierPath(arcCenter: centerPoint, radius: midX - outlineHalfWidth, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        outlinePath.addArcWithCenter(centerPoint, radius: midX - arcWidth + outlineHalfWidth, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        outlinePath.closePath()
        outlineColor.setStroke()
        outlinePath.lineWidth = outlineHalfWidth * 2
        outlinePath.stroke()
    }
}