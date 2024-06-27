//
//  Extension+UIFont.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//


import SwiftUI

extension Font {
    enum FontNames: String {
        case bebasNeue = "BebasNeue-Regular"
    }

    static func customFont(name: FontNames, size: CGFloat) -> Font {
        custom(name.rawValue, size: size)
    }
}

extension UIFont {
    enum FontNames: String {
        case bebasNeue = "BebasNeue-Regular"
    }

    static func customFont(name: FontNames, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name.rawValue, size: size) else {
            fatalError("Unable to load font \(name.rawValue)")
        }
        return font
    }
}
