//
//  GeneratedSetRow.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import SwiftUI

struct GeneratedSetRow: View {
    let exersizeSet: ExerciseSet

    var body: some View {
        HStack {
            Image(.row)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(exersizeSet.name)
                    .font(.headline)
                    .foregroundStyle(.white)

                HStack {
                    HSetStack(image: Image(systemName: "clock"), text: "\(exersizeSet.duration) min.")
                    HSetStack(image: Image(.ballSmallIcon), text: "\(exersizeSet.exercisesCount) exer.")
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.white)
        }
        .padding(12)
        .background(.rowBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    GeneratedSetRow(exersizeSet: setsArray.first!)
}


struct HSetStack: View {
    let image: Image
    let text: String

    var body: some View {
        HStack(spacing: 4) {
            image
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 10))
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .frame(height: 32)
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
