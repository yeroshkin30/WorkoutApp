//
//  StopWatchView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 24.06.2024.
//

import SwiftUI

struct StopWatchView: View {
    @State private var timeElapsed: Int = 0
    @State private var isRunning: Bool = false
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            // Outer glowing circle
            Circle()
                .stroke(Color.red.opacity(0.8), lineWidth: 10)
                .frame(width: 200, height: 200)
                .shadow(color: Color.red.opacity(0.7), radius: 10, x: 0, y: 0)

            // Timer text
            Text(timeString(time: timeElapsed))
                .font(.custom("BebasNeue-Regular", size: 44))
                .foregroundColor(.white)
        }
    }

    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Function to start the stopwatch
    func startTimer(isRunning: Bool) {

        if isRunning {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.timeElapsed += 1
            }
        } else {
            self.timer?.invalidate()
        }
    }
}
