//
//  WorkoutFlowView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

struct WorkoutFlowView: View {
    let sets: [ExerciseSet]
    @State private var path: [Destination] = []
    @State private var sheetDestination: Destination?

    var body: some View {
        NavigationStack(path: $path) {
            WorkoutView(sets: sets) { event in
                handleWorkoutViewEvents(with: event)
            }
            .background(.backgroundMain)
            .navigationDestination(for: Destination.self, destination: destinationView)
        }
        .fullScreenCover(item: $sheetDestination, content: destinationView)
    }
}

private extension WorkoutFlowView {
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .allSets:
            GeneratedSetView(generatedSets: sets) { event in
                handleAllSetViewEvent(with: event)
            }
        case .setsDetail(let exercisesSet):
            SetDetailView(exerciseSet: exercisesSet) { event in
                handleSetDetailViewEvent(with: event)
            }
        case .startTraining(let exerciseSet):
            TrainingFlowView(exerciseSet: exerciseSet) {
                withoutAnimation {
                    path.removeAll()
                }
                sheetDestination = nil
            }
        }
    }

// MARK: - Event handlers

    func handleWorkoutViewEvents(with event: WorkoutView.Event) {
        switch event {
        case .backButtonTaped:
            path.removeLast()
        case .viewAllSets:
            path.append(.allSets)
        case .exerciseSetChosen(let setModel):
            path.append(.setsDetail(setModel))
        }
    }

    func handleAllSetViewEvent(with event: GeneratedSetView.Event) {
        switch event {
        case .backButtonTaped:
            path.removeLast()
        case .exerciseSetChosen(let setModel):
            path.append(.setsDetail(setModel))
        }
    }

    func handleSetDetailViewEvent(with event: SetDetailView.Event) {
        switch event {
        case .backButtonTap:
            path.removeLast()
        case .startTraining(let exerciseSet):
            sheetDestination = .startTraining(exerciseSet)
        }
    }

    enum Destination: Hashable, Identifiable {
        var id: UUID {
            .init()
        }

        case allSets
        case setsDetail(ExerciseSet)
        case startTraining(ExerciseSet)
    }
}

#Preview {
    WorkoutFlowView(sets: setsArray)
}
