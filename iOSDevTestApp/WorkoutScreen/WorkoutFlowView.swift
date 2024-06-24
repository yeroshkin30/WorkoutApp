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

    var body: some View {
        NavigationStack(path: $path) {
            WorkoutView(sets: sets) { event in
                handleWorkoutViewEvents(with: event)
            }
            .background(.backgroundMain)
            .navigationDestination(for: Destination.self, destination: destinationView)
        }
    }

    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .allSets:
            AllSetsView(sets: sets) { event in
                handleAllSetViewEvent(with: event)
            }
        case .setsDetail(let exercizesSet):
            SetDetailView(exercizeSet: exercizesSet) { event in
                handleSetDetailViewEvent(with: event)
            }
        }
    }
    enum Destination: Hashable {
        case allSets
        case setsDetail(ExercizeSet)
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

    func handleAllSetViewEvent(with event: AllSetsView.Event) {
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
            return
        }
    }
}

#Preview {
    WorkoutFlowView(sets: setsArray)
}
