//
//  Extension+String.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 24.06.2024.
//

import Foundation

extension String {
    init(secondsElapsed: Int) {
        let minutes = secondsElapsed / 60
        let seconds = secondsElapsed % 60
        self = String(format: "%02d:%02d", minutes, seconds)
    }
}
