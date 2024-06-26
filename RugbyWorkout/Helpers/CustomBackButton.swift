//
//  CustomBackButton.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct CustomBackButton: View {
    let onTap: () -> Void

    var body: some View {
        Button { onTap() } label: {
            Image(systemName: "arrow.left")
                .foregroundStyle(.white)
                .padding(horizontal: 10, vertical: 12)
                .background(.rowBackground, in: RoundedRectangle(cornerRadius: 16))
        }
    }
}
