//
//  CircularTransaction.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.

import UIKit

class CircularTransaction: NSObject {
    
    var circle = UIView()
    var circleColor = UIColor.darkGray
    var animationSpeed = 0.4
    var startingPoint = CGPoint.zero {
        didSet {
            self.circle.center = startingPoint
        }
    }
    
}

extension CircularTransaction: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.animationSpeed
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
       
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
            
                self.circle = UIView()
                self.circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                self.circle.layer.cornerRadius = circle.frame.size.height / 2
                self.circle.center = self.startingPoint
                self.circle.backgroundColor = circleColor
                self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(self.circle)
                presentedView.center = self.circle.center
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
            
                UIView.animate(withDuration: animationSpeed, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.frame.size = screenSize.size
                    presentedView.alpha = 1
                    presentedView.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
                }, completion: { (success:Bool) in
                    transitionContext.completeTransition(success)
                })
        }
    }
    
    func frameForCircle (withViewCenter viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect {
        let xLength =  fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        let offsetVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offsetVector, height: offsetVector)
        return CGRect(origin: CGPoint.zero, size: size)
    }
}
