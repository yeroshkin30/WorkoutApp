//
//  ExerciseListView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct ExerciseListView: View {
    let exercises: [Exercise]
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("List of exercises".uppercased())
                .font(.customFont(name: .bebasNeue, size: 24))
                .foregroundStyle(.white)
            ScrollView {
                VStack {
                    ForEach (exercises) { exercise in
                        ExerciseRow(exercise: exercise)
                            .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                    }
                }
                .padding(.top, 20)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ExerciseListView(exercises: exercises)
        .background(.backgroundMain)
}
