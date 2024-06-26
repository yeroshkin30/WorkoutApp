//
//  TrainingFlowView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 24.06.2024.
//

import SwiftUI

struct TrainingFlowView: View {
    @State private var showCompleteScreen = false
    @State private var completedExercises: [FinishedExercise] = []
    let exerciseSet: ExerciseSet
    let onNeedDismiss: () -> Void

    var body: some View {
        if let firstExercise = exerciseSet.exercises.first {
            NavigationStack {
                TrainingView(
                    firstExercise: firstExercise,
                    allExercises: exerciseSet.exercises) { event in
                        switch event {
                        case .exerciseFinished(let finishedExercise):
                            completedExercises.append(finishedExercise)
                        case .exerciseSetFinished(let finishedExercise):
                            completedExercises.append(finishedExercise)
                            showCompleteScreen = true
                        case .closeButtonTap:
                            if !completedExercises.isEmpty {
                                showCompleteScreen = true
                            } else {
                                onNeedDismiss()
                            }
                        }
                    }
                    .navigationDestination(isPresented: $showCompleteScreen) {
                        TrainingResultView(
                            completedSet: exerciseSet,
                            completedExercises: completedExercises,
                            onCompleteButtonTap: onNeedDismiss
                        )
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {

        TrainingFlowView(
            exerciseSet: .init(
                name: "test",
                duration: 30,
                exercisesCount: 3, exercises: [
                    Exercise(
                        name: "Push-Ups",
                        repeatsCount: "15",
                        description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up."
                    ),
                    Exercise(
                        name: "Jumping Jacks",
                        repeatsCount: "30",
                        description: "Stand upright with your legs together and arms at your sides, then jump to spread your legs and lift your arms overhead."
                    ),
                    Exercise(
                        name: "Squats",
                        repeatsCount: "20",
                        description: "Stand with feet shoulder-width apart, lower your hips back and down as if sitting in a chair, then return to standing."
                    ),
                    Exercise(
                        name: "Push-Ups",
                        repeatsCount: "15",
                        description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up."
                    ),
                    Exercise(
                        name: "Jumping Jacks",
                        repeatsCount: "30",
                        description: "Stand upright with your legs together and arms at your sides, then jump to spread your legs and lift your arms overhead."
                    ),
                    Exercise(
                        name: "Squats",
                        repeatsCount: "20",
                        description: "Stand with feet shoulder-width apart, lower your hips back and down as if sitting in a chair, then return to standing."
                    )
                ]),
            onNeedDismiss: { }
        )
    }
}

