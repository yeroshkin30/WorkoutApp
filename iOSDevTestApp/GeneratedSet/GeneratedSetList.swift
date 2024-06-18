//
//  GeneratedSetList.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct GeneratedSetList: View {
    let generatedSets: [SetModel]
    var body: some View {
        ScrollView {
            ForEach(generatedSets) { set in
                Button(action: {

                }, label: {
                    GeneratedSetRow(exersizeSet: set)
                })
            }
            .padding()
        }
    }
}


#Preview {
    GeneratedSetList(generatedSets: setsArray)
}
