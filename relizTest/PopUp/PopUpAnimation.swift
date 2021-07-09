//
//  PopUpAnimation.swift
//  relizTest
//
//  Created by Andrey on 07.07.2021.
//

import Foundation
import UIKit

class PopUpAnimation: NSObject {
       
    private let duration: TimeInterval = 0.5
    private let direction: Direction
    
    init(direction: Direction) {
        self.direction = direction
        super.init()
    }
    
    
    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let from = transitionContext.viewController(forKey: .from)
        let to = transitionContext.view(forKey: .to)
        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)

        if self.direction == .pushing {
            to?.frame = finalFrame.offsetBy(dx: finalFrame.width, dy: 0)

            let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
                to?.frame = finalFrame
            }
            
            animator.addCompletion { (position) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            return animator
        } else if self.direction == .dismissing {
            let initialFrame = transitionContext.initialFrame(for: from!)
            
            let animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) {
                from?.view.frame = initialFrame.offsetBy(dx: initialFrame.width*2, dy: 0)
            }
            
            animator.addCompletion { (position) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            return animator
        } else {
            return UIViewPropertyAnimator()
        }
    }
}

extension PopUpAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return self.animator(using: transitionContext)
    }
}
