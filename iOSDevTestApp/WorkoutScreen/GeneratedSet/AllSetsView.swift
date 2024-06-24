//
//  AllSetsView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 19.06.2024.
//

import SwiftUI

struct AllSetsView: View {
    enum Event {
        case backButtonTaped
        case exersizeSetChosen(ExercizeSet)
    }

    @State var sets: [ExercizeSet]
    let onEvent: (Event) -> Void

    var body: some View {
        VStack {
            GeneratedSetList(generatedSets: sets) { exersizeSet in
                onEvent(.exersizeSetChosen(exersizeSet))
            }
        }
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
