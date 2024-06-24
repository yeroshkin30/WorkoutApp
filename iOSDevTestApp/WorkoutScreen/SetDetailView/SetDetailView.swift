//
//  SetDetailView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct SetDetailView: View {
    enum Event {
        case startTraining(ExercizeSet)
        case backButtonTap
    }

    let exercizeSet: ExercizeSet
    let onEvent: (Event) -> Void

    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .top) {
                Image(.detailTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .overlay(alignment: .bottom) {
                        LinearGradient(
                            gradient: Gradient(colors: [Color.backgroundMain, Color.backgroundMain.opacity(0.7), Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    }
            }

            VStack(alignment: .leading, spacing: 20) {
                Text(exercizeSet.name.uppercased())
                    .font(.customFont(name: .bebasNeue, size: 44))
                    .foregroundStyle(.white)
                HStack {
                    HSetStack(image: Image(systemName: "clock"), text: "\(exercizeSet.duration) min.")
                        .background(Color.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    HSetStack(image: Image(.ballSmallIcon), text: "\(exercizeSet.exercisesCount) exer.")
                        .background(Color.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                ExercizeListView(exercizes: exercises)
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
    var startButton: some View {

        Button {} label: {
            HStack {
                Spacer()
                Text("Start Trainig".uppercased())
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

struct CustomBackButton: View {
    let onTap: () -> Void

    var body: some View {
        Button { onTap() } label: {
            Image(systemName: "arrow.left")
                .foregroundStyle(.white)
                .padding(horizontal: 10, vertical: 12)
                .background(.rowBackground, in: RoundedRectangle(cornerRadius: 16))
        }
    }
}


#Preview(body: {
    SetDetailView(exercizeSet: setsArray.first!) { event in
        print("⚠️ test: ")
    }
})
