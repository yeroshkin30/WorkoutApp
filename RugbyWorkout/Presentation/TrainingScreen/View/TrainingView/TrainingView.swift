//
//  TrainingView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 20.06.2024.
//

import SwiftUI

struct TrainingView: View {
    enum Event {
        case exerciseFinished(FinishedExercise)
        case exerciseSetFinished(FinishedExercise)
        case closeButtonTap
    }

    @State private var timeElapsed: Int = 0
    @State private var isRunning: Bool = false
    @State private var viewState: TrainingState
    @State private var alertPresented = false
    @State private var timer: Timer?
    let onEvent: (Event) -> Void

    init(firstExercise: Exercise, allExercises: [Exercise], onEvent: @escaping (Event) -> Void) {
        self.viewState = .init(
            currentExercise: firstExercise,
            allExercises: Array(allExercises.dropFirst()),
            curentExerciseNumber: 1,
            totalExercises: allExercises.count
        )
        self.onEvent = onEvent
    }

    // MARK: - Initialisers

    var body: some View {
        ZStack {
            VStack {
                ExerciseDescriptionView(exercise: viewState.currentExercise)
                Spacer()

                nextExerciseInfoView
                    .padding(.bottom, 30)

                HStack(spacing: 8) {
                    playPauseButton
                    Spacer()
                    nextButton
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }

            ZStack {
                Circle()
                    .stroke(Color.red.opacity(0.8), lineWidth: 10)
                    .shadow(color: Color.red.opacity(0.7), radius: 10, x: 0, y: 0)

                Text(String(secondsElapsed: timeElapsed))
                    .font(.customFont(name: .bebasNeue, size: 44))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 50)
        }
        .background(
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(edges: .top)


        )
        .background(.backgroundMain)
        .toolbar {
            navigationBarButtons
        }
        .alert("Alert", isPresented: $alertPresented) {
            Button("Finish", role: .destructive) { onEvent(.closeButtonTap) }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to finish the workout?")
        }
    }
}

private extension TrainingView {

    func handleNextButtonTap() {
        isRunning = false
        timer?.invalidate()
        let finishedExercise = FinishedExercise(exercise: viewState.currentExercise, trainingTime: timeElapsed)
        timeElapsed = 0

        if viewState.nextExercise != nil {
            viewState.getNextExercise()
            onEvent(.exerciseFinished(finishedExercise))
        } else {
            onEvent(.exerciseSetFinished(finishedExercise))
        }
    }

    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timeElapsed += 1
        }
    }

    @ToolbarContentBuilder
    var navigationBarButtons: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("\(viewState.currentExerciseNumber)")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)

                Text("/\(viewState.totalExercise)")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
            }
        }

        ToolbarItem(placement: .topBarTrailing) {
            Button { alertPresented = true } label: {
                Image(.xmark)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 16))
            }
        }
    }

    var nextExerciseInfoView: some View {
        HStack {
            Text("Next:")
                .font(.customFont(name: .bebasNeue, size: 16))
                .foregroundColor(.gray)
            Text(viewState.nextExercise?.name ?? "FINISH")
                .font(.customFont(name: .bebasNeue, size: 20))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "play.circle")
                .foregroundColor(.gray)
        }
        .padding()
        .background(.rowBackground, in: RoundedRectangle(cornerRadius: 20))
        .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.1), lineWidth: 1)
            )
        .padding(.horizontal)
    }

    var playPauseButton: some View {
        Button {
            isRunning.toggle()
            if isRunning {
                startTimer()
            } else {
                timer?.invalidate()
            }
        } label: {
            Image(systemName: isRunning ? "pause.fill" : "play.fill")
                .font(.system(size: 24))
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.customRed, lineWidth: 2)
                )
        }
    }

    var nextButton: some View {
        Button {
            handleNextButtonTap()
        } label: {
            Text(viewState.nextExercise != nil ? "NEXT" : "FINISH")
                .font(.customFont(name: .bebasNeue, size: 24))
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(.customRed, in: RoundedRectangle(cornerRadius: 12))
        }
    }

    struct TrainingState {
        private var iterator: IndexingIterator<[Exercise]>
        var currentExercise: Exercise
        var nextExercise: Exercise?
        var currentExerciseNumber: Int
        var totalExercise: Int
        var trainingTime: Int = 0
        var isRunning: Bool = false
        private var timer: Timer?

        init(currentExercise: Exercise, allExercises: [Exercise], curentExerciseNumber: Int, totalExercises: Int) {
            var iterator = allExercises.makeIterator()
            self.nextExercise = iterator.next()
            self.iterator = iterator
            self.currentExercise = currentExercise
            self.currentExerciseNumber = curentExerciseNumber
            self.totalExercise = totalExercises
        }

        mutating func getNextExercise() {
            if let nextExercise {
                currentExerciseNumber += 1
                currentExercise = nextExercise
                self.nextExercise = iterator.next()
            }
        }
    }
}

#Preview(body: {
    TrainingView(firstExercise: setsArray.first!.exercises.first!, allExercises: setsArray.first!.exercises, onEvent: { _ in })
})
