//
//  Exercize.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import Foundation

// MARK: - Exercise Model
struct Exercise: Identifiable {
    let id: UUID = .init()
    let name: String
    let repeatsCount: String
    let description: String
}
