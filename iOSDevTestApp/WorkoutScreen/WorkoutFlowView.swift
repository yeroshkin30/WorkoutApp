//
//  WorkoutFlowView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

struct WorkoutFlowView: View {
    @State var sets: [ExercizeSet] = setsArray
    @State private var path: [Destination] = []
    @State private var sheetDestination: Destination?

    var body: some View {
        NavigationStack(path: $path) {
            WorkoutView(generatedSets: sets) { event in
                handleWorkoutViewEvents(with: event)
            }
            .background(.backgroundMain)
            .navigationDestination(for: Destination.self, destination: destinationView)
        }
        .fullScreenCover(item: $sheetDestination, content: destinationView)
    }

    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .allSets:
            GeneratedSetView(generatedSets: sets) { event in
                handleAllSetViewEvent(with: event)
            }
        case .setsDetail(let exercisesSet):
            SetDetailView(exercizeSet: exercisesSet) { event in
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

    enum Destination: Hashable, Identifiable {
        var id: UUID {
            .init()
        }

        case allSets
        case setsDetail(ExercizeSet)
        case startTraining(ExercizeSet)
    }
}

// MARK: - Event handlers

private extension WorkoutFlowView {
    func handleWorkoutViewEvents(with event: WorkoutView.Event) {
        switch event {
        case .backButtonTaped:
            path.removeLast()
        case .viewAllSets:
            path.append(.allSets)
        case .exersizeSetChosen(let setModel):
            path.append(.setsDetail(setModel))
        }
    }

    func handleAllSetViewEvent(with event: GeneratedSetView.Event) {
        switch event {
        case .backButtonTaped:
            path.removeLast()
        case .exersizeSetChosen(let setModel):
            path.append(.setsDetail(setModel))
        }
    }

    func handleSetDetailViewEvent(with event: SetDetailView.Event) {
        switch event {
        case .backButtonTap:
            path.removeLast()
        case .startTraining(let exersizeSet):
            sheetDestination = .startTraining(exersizeSet)
        }
    }
}

#Preview {
    WorkoutFlowView(sets: setsArray)
}
