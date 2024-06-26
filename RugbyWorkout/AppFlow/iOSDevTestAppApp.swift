//
//  iOSDevTestAppApp.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

@main
struct iOSDevTestAppApp: App {

    init() {
        setupNavigationBarAppearance()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    private func setupNavigationBarAppearance() {

    }
}


struct iOSDevTestAppApp_Previews: PreviewProvider {
    static var previews: some View {
        iOSDevTestAppApp_PreviewWrapper()
    }

    struct iOSDevTestAppApp_PreviewWrapper: View {
        var body: some View {
            ContentView()
        }
    }
}
