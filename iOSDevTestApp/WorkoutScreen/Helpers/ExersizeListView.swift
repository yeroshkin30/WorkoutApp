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
                .font(.customFont(name: .bebasNeue, size: 24))
                .foregroundStyle(.white)
                .padding(.horizontal)
            ScrollView {
                VStack {
                    ForEach (exercizes) { exercize in
                        ExercizeRow(exersize: exercize)
                            .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ExersizeListView(exercizes: exercises)
        .background(.backgroundMain)
}
