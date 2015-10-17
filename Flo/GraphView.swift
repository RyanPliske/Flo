import UIKit

@IBDesignable class GraphView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.redColor()
    @IBInspectable var endColor: UIColor = UIColor.greenColor()
    
    override func drawRect(rect: CGRect) {
        let cgContext = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0, 1.0]
        let cgGradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: CGRectGetHeight(bounds))
        //TODO: Check out CGGradientDrawingOptions
        CGContextDrawLinearGradient(cgContext, cgGradient, startPoint, endPoint, CGGradientDrawingOptions.DrawsBeforeStartLocation)
    }
}