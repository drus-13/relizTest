//
//  ShowViewController.swift
//  relizTest
//
//  Created by Andrey on 06.07.2021.
//

import UIKit

class ShowViewController: UIViewController {
        
    private var vcTitle: String
    private var firstButtonTitle: String
    private var secondButtonTitle: String
    private var thirdButtonTitle: String
    private var viewBackgroundColour: UIColor
    
    private var configDictionary: [String: UIColor] = ["Screen 1": UIColor(red: 215/255, green: 220/255, blue: 252/255, alpha: 1), "Screen 2": UIColor(red: 212/255, green: 178/255, blue: 242/255, alpha: 1), "Screen 3": UIColor(red: 212/255, green: 240/255, blue: 219/255, alpha: 1), "Screen 4": UIColor(red: 253/255, green: 242/255, blue: 200/255, alpha: 1)]

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let screenOneButton: ScreenButton = {
        let button = ScreenButton(title: "")
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    private let screenTwoButton: ScreenButton = {
        let button = ScreenButton(title: "")
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    private let screenThreeButton: ScreenButton = {
        let button = ScreenButton(title: "")
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()

    
    private func addConstraints() {
        self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.dismissButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.dismissButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        

        self.screenOneButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.screenOneButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.screenOneButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.screenOneButton.bottomAnchor.constraint(equalTo: self.screenTwoButton.topAnchor, constant: -20).isActive = true
        
        self.screenTwoButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.screenTwoButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.screenTwoButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.screenTwoButton.bottomAnchor.constraint(equalTo: self.screenThreeButton.topAnchor, constant: -20).isActive = true

        self.screenThreeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.screenThreeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.screenThreeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.screenThreeButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        
    }
    
    private func setupUI() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.layer.cornerRadius = 15
        
        self.titleLabel.text = vcTitle
        self.view.backgroundColor = viewBackgroundColour
        self.screenOneButton.setTitle(firstButtonTitle, for: .normal)
        self.screenTwoButton.setTitle(secondButtonTitle, for: .normal)
        self.screenThreeButton.setTitle(thirdButtonTitle, for: .normal)
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.dismissButton)
        self.view.addSubview(self.screenOneButton)
        self.view.addSubview(self.screenTwoButton)
        self.view.addSubview(self.screenThreeButton)
    }
    
    @objc private func buttonClicked(_ sender: UIButton) {

        let newVC = ShowViewController(numberOfScreen: sender.title(for: .normal)!)
        
        self.push(viewController: newVC)
    }
    
    @objc private func dismissButtonClicked() {
        self.dismissCustom()
        backToRootViewController()
    }
    
    init(numberOfScreen: String) {
        
        
        self.vcTitle = numberOfScreen
        self.viewBackgroundColour = configDictionary[numberOfScreen]!
        
        configDictionary.removeValue(forKey: numberOfScreen)
        var tmp: [String] = []
        
        configDictionary.keys.forEach { key in
            tmp.append(key)
        }
        
        tmp.sort()
        
        self.firstButtonTitle = tmp[0]
        self.secondButtonTitle = tmp[1]
        self.thirdButtonTitle = tmp[2]
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addConstraints()

    }



}



