//
//  SplashView.swift
//  Reminder
//
//  Created by Ian Costa on 10/06/25.
//

import Foundation
import UIKit

class SplashView: UIView {
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLogoLabel: UILabel = {
        let label = UILabel()
        label.text = "Remind"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = UIColor(red: 192/255, green: 38/255, blue: 54/255, alpha: 1)
        
        addSubview(logoImageView)
        addSubview(titleLogoLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLogoLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 24),
            titleLogoLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24),
            
            logoImageView.trailingAnchor.constraint(equalTo: titleLogoLabel.leadingAnchor, constant: -8),
            logoImageView.bottomAnchor.constraint(equalTo: titleLogoLabel.bottomAnchor)
        ])
    }
}
