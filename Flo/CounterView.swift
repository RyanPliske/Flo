import UIKit

let NoOfGlasses = 8
let π = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <=  NoOfGlasses {
                setNeedsDisplay()
            }
        }
    }
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
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        outlineColor.setFill()
        
        let markerWidth: CGFloat = 5.0
        let markerHeight: CGFloat = 10.0
        let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth/2, y: 0, width: markerWidth, height: markerHeight))
        CGContextTranslateCTM(context, rect.width/2, rect.height/2)
        
        for i in 1...NoOfGlasses {
            CGContextSaveGState(context)
            let rotationAngle = arcLengthPerGlass * CGFloat(i) + startAngle - π/2
            CGContextRotateCTM(context, rotationAngle)
            CGContextTranslateCTM(context, 0, rect.height/2 - markerHeight)
            markerPath.fill()
            CGContextRestoreGState(context)
        }
        CGContextRestoreGState(context)
    }
}