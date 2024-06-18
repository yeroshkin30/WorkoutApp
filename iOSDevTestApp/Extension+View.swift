//
//  Extension+View.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 18.06.2024.
//

import SwiftUI

extension View {
    @inlinable public func padding(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> some View {
        padding(EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }

    @inlinable public func padding(horizontal: CGFloat, vertical: CGFloat) -> some View {
        padding(EdgeInsets(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal))
    }

    func safeArea() -> UIEdgeInsets {
        let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene

        return screen?.windows.first?.safeAreaInsets ?? .zero
    }

    var hasNotch: Bool {
        safeArea().bottom > 0
    }
}
