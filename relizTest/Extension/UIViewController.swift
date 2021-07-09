//
//  UIViewController.swift
//  relizTest
//
//  Created by Andrey on 08.07.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func popUp(viewController: UIViewController) {
        viewController.modalPresentationStyle = .custom
        let popUpTransition = PopUpTransition()
        viewController.transitioningDelegate = popUpTransition
        present(viewController, animated: true, completion: nil)
    }
    
    func dismissCustom() {
        self.navigationController?.modalPresentationStyle = .custom
        let popUpTransition = PopUpTransition()
        self.navigationController?.transitioningDelegate = popUpTransition
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func push(viewController: UIViewController) {
        let animation = PushAnimation(direction: .pushing)
        navigationController?.delegate = animation
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func backToRootViewController() {
        let animation = PushAnimation(direction: .dismissing)
        navigationController?.delegate = animation
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
