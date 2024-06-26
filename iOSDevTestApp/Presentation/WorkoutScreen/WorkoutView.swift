//
//  WorkoutView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI


class ViewModel: ObservableObject {
    @Published var searchText: String = "" {
        didSet {
            updateFilteredItems()
        }
    }
    @Published var filteredItems: [ExerciseSet] = []
    private var exerciseSets: [ExerciseSet]

    init(sets: [ExerciseSet]) {
        self.exerciseSets = sets
        updateFilteredItems()
    }

    private func updateFilteredItems() {
        if searchText.isEmpty {
            filteredItems = exerciseSets
        } else {
            filteredItems = exerciseSets.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct WorkoutView: View {
    enum Event {
        case backButtonTaped
        case viewAllSets
        case exersizeSetChosen(ExerciseSet)
    }

    @StateObject var viewModel: ViewModel
    let onEvent: (Event) -> Void

    init(sets: [ExerciseSet], onEvent: @escaping (Event) -> Void) {
        self._viewModel = StateObject(wrappedValue: ViewModel(sets: sets))
        self.onEvent = onEvent
    }

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image(.topRedBackgorund)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text("Hello, champion! 👋")
                        .font(.customFont(name: .bebasNeue, size: 28))
                        .foregroundStyle(.white)
                    TextField("Search...", text: $viewModel.searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding()
            }
            headerView
            ScrollView {
                ForEach(viewModel.filteredItems) { exercizeSet in
                    Button(action: {
                        onEvent(.exersizeSetChosen(exercizeSet))
                    }, label: {
                        GeneratedSetRow(exersizeSet: exercizeSet)
                    })
                }
                .padding()
            }
        }
        .background(.backgroundMain)
        .ignoresSafeArea(edges: .top)
    }
}

private extension WorkoutView {
    var headerView: some View {
        HStack {
            Text("Generated sets".uppercased())
                .font(.system(size: 24))
                .foregroundStyle(.white)
            Spacer()
            Button { onEvent(.viewAllSets) } label: {
                HStack {
                    Text("View all")
                        .font(.system(size: 12))
                        .foregroundStyle(.customRed)
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.customRed)
                }
            }
        }
        .padding()
    }
}
