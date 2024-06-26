//
//  CompletedExerciseRow.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 25.06.2024.
//

import SwiftUI

struct CompletedExerciseRow: View {
    let name: String
    let trainingTime: Int

    var body: some View {
        HStack {
            Text(name)
                .foregroundStyle(.white)
                .font(.customFont(name: .bebasNeue, size: 20))
            Spacer()
            HStack {
                Text(String(secondsElapsed: trainingTime))
                    .foregroundStyle(.white)
                    .font(.customFont(name: .bebasNeue, size: 17))
                Text(" min.")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.system(size: 12))
            }
        }
        .padding(horizontal: 16, vertical: 5)
    }
}
