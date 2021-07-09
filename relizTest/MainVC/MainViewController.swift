//
//  ViewController.swift
//  relizTest
//
//  Created by Andrey on 06.07.2021.
//

import UIKit

class MainViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu"
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonScreenOne: ScreenButton = {
        let button = ScreenButton(title: "Screen 1 - Pop Up")
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    private let buttonScreenTwo: ScreenButton = {
        let button = ScreenButton(title: "Screen 1")
        button.addTarget(self, action: #selector(secondButtonClicked), for: .touchUpInside)
        return button
    }()
        
    @objc private func buttonClicked(_ sender: UIButton) {
        
        let showViewController = ShowViewController(numberOfScreen: "Screen 1")
        let navVC = UINavigationController(rootViewController: showViewController)
        popUp(viewController: navVC)
    }
    
    @objc private func secondButtonClicked(_ sender: UIButton) {
        let showViewController = ShowViewController(numberOfScreen: sender.title(for: .normal)!)
        push(viewController: showViewController)
    }
    
    
    
    private func addConstraints() {
        
        self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.buttonScreenOne.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.buttonScreenOne.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.buttonScreenOne.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.buttonScreenOne.bottomAnchor.constraint(equalTo: self.buttonScreenTwo.topAnchor, constant: -20).isActive = true
        
        
        self.buttonScreenTwo.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.buttonScreenTwo.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.buttonScreenTwo.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.buttonScreenTwo.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.addSubview(titleLabel)
        self.view.addSubview(self.buttonScreenOne)
        self.view.addSubview(self.buttonScreenTwo)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addConstraints()
        
        
    }
        
}
