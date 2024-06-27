//
//  RugbyWorkoutApp.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

@main
struct RugbyWorkoutApp: App {
    var body: some Scene {
        WindowGroup {
            AppFlowView()
        }
    }
}


struct RugbyWorkoutAppApp_Previews: PreviewProvider {
    static var previews: some View {
        RugbyWorkoutAppApp_PreviewWrapper()
    }

    struct RugbyWorkoutAppApp_PreviewWrapper: View {
        var body: some View {
            AppFlowView()
        }
    }
}
