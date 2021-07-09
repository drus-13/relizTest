//
//  ScreenButton.swift
//  relizTest
//
//  Created by Andrey on 06.07.2021.
//

import UIKit

class ScreenButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    init(title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor(red: 129/255, green: 141/255, blue: 245/255, alpha: 1)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
