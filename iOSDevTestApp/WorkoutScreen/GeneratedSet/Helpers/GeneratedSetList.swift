//
//  GeneratedSetList.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct GeneratedSetList: View {
    let generatedSets: [ExercizeSet]
    let onSelectedSet: (ExercizeSet) -> Void

    var body: some View {
        ScrollView {
            ForEach(generatedSets) { set in
                Button(action: {
                    onSelectedSet(set)
                }, label: {
                    GeneratedSetRow(exersizeSet: set)
                })
            }
            .padding()
        }
    }
}
