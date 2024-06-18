//
//  SetDetailView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct SetDetailView: View {
    let exercizeSet: SetModel

    var body: some View {


        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(exercizeSet.name)
                    .font(.system(size: 44))
                HStack {
                    HSetStack(imageName: "clock", text: "\(exercizeSet.duration) min.")
                        .background(Color.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    HSetStack(imageName: "leaf", text: "\(exercizeSet.exercisesCount) exer.")
                        .background(Color.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()

            ExersizeListView(exercizes: exercises)
        }
        .background(.clear)

    }
}
#Preview {
    SetDetailView(exercizeSet: setsArray.first!)
        .background(.backgroundMain)

}
