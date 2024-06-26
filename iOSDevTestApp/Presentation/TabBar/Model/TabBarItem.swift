//
//  TabBarItem.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

enum TabBarItem {
    case workout
    case settings

    var image: Image {
        switch self {
        case .workout:
            Image(.workoutIcon)
        case .settings:
            Image(.settingsIcon)
        }
    }

    var name: String {
        switch self {
        case .workout:
            return "Workout"
        case .settings:
            return "Settings"
        }
    }
}
