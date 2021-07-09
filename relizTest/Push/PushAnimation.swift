//
//  PushAnimation.swift
//  relizTest
//
//  Created by Andrey on 08.07.2021.
//

import Foundation
import UIKit


import Foundation
import UIKit

class PushAnimation: NSObject {
    
    private let duration: TimeInterval = 0.5
    private var direction: Direction
    
    init(direction: Direction) {
        self.direction = direction
        super.init()
    }

}

extension PushAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
              let toView = transitionContext.viewController(forKey: .to)?.view else { return }
        // Check
        if direction == .pushing {
            pushingFromBottom(fromView, to: toView, context: transitionContext)
        } else if direction == .dismissing {
            dismissingFromTop(fromView, to: toView, context: transitionContext)
        }
    }

    private func pushingFromBottom(_ from: UIView, to: UIView, context:  UIViewControllerContextTransitioning) {
        context.containerView.addSubview(to)

        let finalFrame = context.finalFrame(for: context.viewController(forKey: .to)!)
        to.transform = CGAffineTransform(translationX: 0, y: finalFrame.height)
        UIView.animate(withDuration: duration, animations: {
            to.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { _ in
            context.completeTransition(true)
        }

    }
    
    private func dismissingFromTop(_ from: UIView, to: UIView, context:  UIViewControllerContextTransitioning) {
        context.containerView.addSubview(to)
        
        let finalFrame = context.finalFrame(for: context.viewController(forKey: .to)!)
        to.transform = CGAffineTransform(translationX: 0, y: -finalFrame.height)
            UIView.animate(withDuration: duration, animations: {
                to.transform = CGAffineTransform(translationX: 0, y: 0)
                
            }) { (_) in
                context.completeTransition(true)
            }
    }
}

extension PushAnimation: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return PushAnimation(direction: direction)

    }
}
