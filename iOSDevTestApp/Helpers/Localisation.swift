//
//  Localisation.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 18.06.2024.
//
import Foundation

extension String {
    enum Localized {

        // MARK: - Common
        static let mainCollageTitle = String(localized: "Collage", comment: "Main screen title")
        static let continueButton = String(localized: "Continue")

        // MARK: - Setting screen
        enum Settings {
            static let navigationTitle = String(localized: "Settings")
            static let privacyPolicyTitle = String(localized: "Privacy Policy")
            static let termsOfUse = String(localized: "Terms of Use")
        }
    }
}
