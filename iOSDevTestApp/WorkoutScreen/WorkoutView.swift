//
//  WorkoutView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

struct WorkoutView: View {
    enum Event {
        case backButtonTaped
        case viewAllSets
        case exersizeSetChosen(ExercizeSet)
    }

    @State var generatedSets: [ExercizeSet]
    let onEvent: (Event) -> Void

    var body: some View {
        VStack {
            headerView
            ScrollView {
                ForEach(generatedSets) { exercizeSet in
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
