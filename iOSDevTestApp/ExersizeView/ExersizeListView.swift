//
//  ExersizeListView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct ExersizeListView: View {
    let exercizes: [Exercise]
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("List of exercises".uppercased())
                .font(.system(size: 24))
                .padding(.horizontal)
            List {
                ForEach (exercizes) { exercize in
                    ExercizeRow(exersize: exercize)
                        .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .padding()
            .background(Color.clear)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ExersizeListView(exercizes: exercises)
        .background(.red)
}
