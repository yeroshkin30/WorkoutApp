//
//  TrainingResustView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 25.06.2024.
//

import SwiftUI

struct TrainingResultView: View {
    
    @State var comletedSet: ExercizeSet = setsArray.first!
    @State var completedExercises: [FinishedExercize]
    let onCompleteButtonTap: () -> Void

    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Text("Workout completed")
                    .foregroundStyle(.customRed)
                    .font(.system(size: 17))
                Text(comletedSet.name)
                    .foregroundStyle(.white)
                    .font(.customFont(name: .bebasNeue, size: 44))
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Text("Time")
                            .foregroundStyle(.white.opacity(0.5))
                            .font(.system(size: 12))
                        Text(String(secondsElapsed: completedExercises.reduce(0, { $0 + $1.trainingTime})))
                            .foregroundStyle(.white)
                            .font(.customFont(name: .bebasNeue, size: 32))
                    }

                    Spacer()

                    VStack(spacing: 8) {
                        Text("Exercises")
                            .foregroundStyle(.white.opacity(0.5))
                            .font(.system(size: 12))
                        Text("\(completedExercises.count)/\(comletedSet.exercisesCount) ")
                            .foregroundStyle(.white)
                            .font(.customFont(name: .bebasNeue, size: 32))
                    }
                    Spacer()
                }

            }
            .padding(.bottom)
            .background(.rowBackground)

            VStack(alignment: .leading) {

                Text("Detail of training".uppercased())
                    .font(.customFont(name: .bebasNeue, size: 24))
                    .foregroundStyle(.white)
                    .padding()
                ScrollView {
                    VStack {
                        ForEach(completedExercises, id: \.id) { completedExercise in
                            CompletedExerciseRow(
                                name: completedExercise.exercize.name,
                                trainingTime: completedExercise.trainingTime
                            )
                        }
                    }
                }
            }
        }
        .background(.backgroundMain)
        .safeAreaInset(edge: .bottom, content: {
            Button { onCompleteButtonTap() } label: {
                HStack {
                    Spacer()
                    Text("Complete".uppercased())
                        .font(.customFont(name: .bebasNeue, size: 20))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(.checkmark)
                }
                .padding()
                .background(.customRed, in: RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        })
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    TrainingResultView(completedExercises: [
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
        .init(exercize: .init(name: "Exercise1", repeatsCount: "asdfa", description: ""), trainingTime: 150),
    ]) { }
}
