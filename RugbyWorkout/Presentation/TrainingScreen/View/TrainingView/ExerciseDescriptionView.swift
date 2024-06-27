//
//  ExerciseDescriptionView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct ExerciseDescriptionView: View {
    let exercise: Exercise

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("X\(exercise.repeatsCount)")
                    .font(.customFont(name: .bebasNeue, size: 24))
                    .foregroundColor(.white.opacity(0.5))
                Text(exercise.name)
                    .font(.customFont(name: .bebasNeue, size: 24))
                    .foregroundColor(.white)
            }
            .padding(.bottom)

            Text(exercise.description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
