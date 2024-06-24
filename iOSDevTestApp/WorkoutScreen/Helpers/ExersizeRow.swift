//
//  ExercizeRow.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct ExercizeRow: View {
    let exersize: Exercise

    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(.gray)
                .padding(0)
            VStack(alignment: .leading, spacing: 12) {
                Text(exersize.name)
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                HStack {
                    Text("Recommended to repeat:")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.5))
                    Spacer()
                    Text("X\(exersize.repeatsCount)")
                        .font(.system(size: 12))
                        .foregroundStyle(.white)
                }
            }
            .padding(12)
            .background(Color(.rowBackground))
        }
        .clipShape(RoundedCorner(radius: 12,corners: [.topRight, .bottomRight]))
    }
}

#Preview {
    ExercizeRow(exersize: Exercise(
        name: "Push-Ups",
        repeatsCount: "15",
        description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up."
    ))
}
