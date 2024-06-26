//
//  SetDetailView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct SetDetailView: View {
    enum Event {
        case startTraining(ExerciseSet)
        case backButtonTap
    }

    let exerciseSet: ExerciseSet
    let onEvent: (Event) -> Void

    var body: some View {
        ZStack(alignment: .top) {
            Image(.team)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()


            VStack(alignment: .leading, spacing: 20) {
                topSetInfoView
                ExerciseListView(exercises: exercises)
            }
            .padding()
            .padding(.top, 30)
        }
        .background(.backgroundMain)
        .navigationBarBackButtonHidden()
        .navigationTitle("Set Detail")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton { onEvent(.backButtonTap) }
            }
        }
        .overlay(alignment: .bottom) {
            LinearGradient(
                gradient: Gradient(colors: [Color.clear, Color.backgroundMain, Color.backgroundMain]),
                startPoint: .top,
                endPoint: .center
            )
            .edgesIgnoringSafeArea(.all)
            .frame(height: 70)
        }
        .safeAreaInset(edge: .bottom) {
            startButton
                .padding()
                .padding(.top, 12)
        }

    }
}

extension SetDetailView {

    var topSetInfoView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(exerciseSet.name.uppercased())
                .font(.customFont(name: .bebasNeue, size: 44))
                .foregroundStyle(.white)
            HStack {
                HSetStack(image: Image(systemName: "clock"), text: "\(exerciseSet.duration) min.")
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                HSetStack(image: Image(.ballSmallIcon), text: "\(exerciseSet.exercisesCount) exer.")
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }

    var startButton: some View {
        Button { onEvent(.startTraining(exerciseSet)) } label: {
            HStack {
                Spacer()
                Text("Start Training".uppercased())
                    .font(.customFont(name: .bebasNeue, size: 20))
                    .foregroundStyle(.white)
                Spacer()
                Image(.fire)
            }
            .padding()
            .background(.customRed, in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview(body: {
    SetDetailView(exerciseSet: setsArray.first!) { event in
        print("⚠️ test: ")
    }
})
