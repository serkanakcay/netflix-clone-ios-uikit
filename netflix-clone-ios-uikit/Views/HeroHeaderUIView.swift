//
//  HeroHeaderUIView.swift
//  netflix-clone-ios-uikit
//
//  Created by serkan on 5.12.2024.
//

import UIKit

class HeroHeaderUIView: UIView {
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
    }
    override func layoutSubviews() {
        heroImageView.frame = bounds
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
