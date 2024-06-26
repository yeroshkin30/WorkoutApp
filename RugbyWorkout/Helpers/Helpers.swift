//
//  Helpers.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 25.06.2024.
//

import SwiftUI

@discardableResult
func withoutAnimation<Result>(_ body: () throws -> Result) rethrows -> Result {
    var transaction = SwiftUI.Transaction()
    transaction.disablesAnimations = true
    return try withTransaction(transaction, body)
}
