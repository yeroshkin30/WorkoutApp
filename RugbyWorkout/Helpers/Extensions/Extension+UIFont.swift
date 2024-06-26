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
