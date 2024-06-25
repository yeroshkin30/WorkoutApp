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
        case exersizeSetChosen(ExercizeSet)
    }

    @State var generatedSets: [ExercizeSet]
    let onEvent: (Event) -> Void

    var body: some View {
        VStack {
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
        .background(
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
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
