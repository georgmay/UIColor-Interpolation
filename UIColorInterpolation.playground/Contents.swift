import UIKit

extension UIColor {
    func lerp(to color: UIColor, fraction: CGFloat) -> UIColor {
        precondition(fraction >= 0.0 && fraction <= 1.0)
        
        let defaultColorSpace = CGColorSpaceCreateDeviceRGB()
        
        let startColor = self.cgColor.converted(
            to: defaultColorSpace,
            intent: .absoluteColorimetric,
            options: nil)
        
        let endColor = color.cgColor.converted(
            to: defaultColorSpace,
            intent: .absoluteColorimetric,
            options: nil)
        
        guard let scc = startColor?.components else {
            fatalError("Unable to fetch start color components")
        }
        
        guard let ecc = endColor?.components else {
            fatalError("Unable to fetch end color components")
        }
        
        var lerpedComponents: [CGFloat] = []
        
        for component in 0..<4 {
            lerpedComponents.append(scc[component] + (ecc[component] - scc[component]) * fraction)
        }
        
        let lerpedColor = CGColor(colorSpace: defaultColorSpace, components: lerpedComponents)
        
        return UIColor(cgColor: lerpedColor!)
    }
}

let startColor = UIColor.blue
let endColor = UIColor.white

startColor.lerp(to: endColor, fraction: 0)
startColor.lerp(to: endColor, fraction: 0.1)
startColor.lerp(to: endColor, fraction: 0.2)
startColor.lerp(to: endColor, fraction: 0.3)
startColor.lerp(to: endColor, fraction: 0.4)
startColor.lerp(to: endColor, fraction: 0.5)
startColor.lerp(to: endColor, fraction: 0.6)
startColor.lerp(to: endColor, fraction: 0.7)
startColor.lerp(to: endColor, fraction: 0.8)
startColor.lerp(to: endColor, fraction: 0.9)
startColor.lerp(to: endColor, fraction: 1)