//
//  PopUpTransition.swift
//  relizTest
//
//  Created by Andrey on 07.07.2021.
//

import UIKit

class PopUpTransition: NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK: - Presentation controller
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        
        return PopUpPresentController(presentedViewController: presented, presenting: presenting)
    }
    
    // MARK: - Animation
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopUpAnimation(direction: .pushing)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopUpAnimation(direction: .dismissing)
    }
    
}
