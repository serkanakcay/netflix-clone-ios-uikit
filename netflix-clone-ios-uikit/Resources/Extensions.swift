//
//  Extensions.swift
//  netflix-clone-ios-uikit
//
//  Created by serkan on 23.01.2025.
//

import Foundation

extension String{
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
