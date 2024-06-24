//
//  TrainingView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 20.06.2024.
//

import SwiftUI

struct FinishedExercize {
    let exercize: Exercise
    let trainingTime: Int
}

struct StopwatchView: View {

    let onEvent: () -> Void

    let exercizeSet: ExercizeSet
    @State private var timeElapsed: Int = 0
    @State private var isRunning: Bool = false
    @State private var timer: Timer?


    @State var exersizeIterator: IndexingIterator<[Exercise]>
    @State private var currentExersize: Exercise!
    @State var nextExersize: Exercise?
    @State var exersizeNumber: Float = 0
    var finishedExercizes: [FinishedExercize] = []

    // MARK: - Initialisers

    init(exercizeSet: ExercizeSet = setsArray.first!, onEvent: @escaping () -> Void = {}) {
        self.exercizeSet = exercizeSet
        self.exersizeIterator = exercizeSet.exercises.makeIterator()
        self.onEvent = onEvent
        self._currentExersize = .init(initialValue: exersizeIterator.next())
        self._nextExersize = .init(initialValue: exersizeIterator.next())
    }

    var body: some View {
        VStack {
            Spacer()

            if let currentExersize {
                ExersizeDescriptionView(
                    repeatCount: currentExersize.repeatsCount,
                    name: currentExersize.name,
                    description: currentExersize.description
                )
            }
            Spacer()

            nextTaskStackView

            HStack {
                Button {
                    handeNextButtonTap()
                } label: {
                    Text("NEXT")
                        .font(.custom("BebasNeue-Regular", size: 24))
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(.red, in: RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding(.horizontal)
        }
        .background(.backgroundMain)
    }

    func handeNextButtonTap() {
        if let nextExersize {
            currentExersize = nextExersize
            self.nextExersize = exersizeIterator.next()
            let finishedExerice = FinishedExercize(exercize: currentExersize, trainingTime: timeElapsed)
        } else {
            onEvent()
        }
    }

    // Function to format time as MM:SS
//    timelineView !!!!!!
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Function to start the stopwatch
    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timeElapsed += 1
        }
    }
}

extension StopwatchView {
    @ViewBuilder
    var nextTaskStackView: some View {
        if let nextExersize {
            HStack {
                Text("Next:")
                    .font(.customFont(name: .bebasNeue, size: 16))
                    .foregroundColor(.gray)
                Text(nextExersize.name)
                    .font(.customFont(name: .bebasNeue, size: 20))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "play.circle")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.rowBackground))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}


struct ExersizeDescriptionView: View {
    let repeatCount: String
    let name: String
    let description: String

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(repeatCount)
                    .font(.customFont(name: .bebasNeue, size: 24))
                    .foregroundColor(.gray)
                Text(name)
                    .font(.customFont(name: .bebasNeue, size: 24))
                    .foregroundColor(.white)
            }
            .padding(.bottom)

            Text(description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    StopwatchView()
}
