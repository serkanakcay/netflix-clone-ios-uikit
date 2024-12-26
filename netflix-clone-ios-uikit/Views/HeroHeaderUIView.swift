//
//  HeroHeaderUIView.swift
//  netflix-clone-ios-uikit
//
//  Created by serkan on 5.12.2024.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downLoadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton: UIButton = {
    let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    private var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
            
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
            
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downLoadButton)
        applyConstraints()

    }
    
    private func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70), //  leadingAnchor kullanıldı
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadButtonConstaints = [
            downLoadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downLoadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downLoadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstaints)
    }
    
    
    
    
    
    override func layoutSubviews() {
        heroImageView.frame = bounds
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
