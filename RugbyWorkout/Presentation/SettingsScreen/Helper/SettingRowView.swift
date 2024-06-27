//
//  SettingRowView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct SettingsRowView: View {
    let image: Image
    let text: String

    var body: some View {
        HStack {
            image
            Text(text)
                .font(.system(size: 17))
                .foregroundStyle(Color.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.white)
        }
        .padding()
    }
}

