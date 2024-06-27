//
//  GeneratedSetView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

struct GeneratedSetView: View {
    enum Event {
        case backButtonTaped
        case exerciseSetChosen(ExerciseSet)
    }

    let generatedSets: [ExerciseSet]
    let onEvent: (Event) -> Void

    var body: some View {
        VStack {
            ScrollView {
                ForEach(generatedSets) { exerciseSet in
                    Button(action: {
                        onEvent(.exerciseSetChosen(exerciseSet))
                    }, label: {
                        GeneratedSetRow(exerciseSet: exerciseSet)
                    })
                }
                .padding()
            }
        }
        .background(
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        .background(.backgroundMain)
        .navigationTitle("Generated sets")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { onEvent(.backButtonTaped) } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.white)
                        .padding(horizontal: 10, vertical: 12)
                        .background(.rowBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        GeneratedSetView(generatedSets: setsArray, onEvent: { _ in })
    }
}
