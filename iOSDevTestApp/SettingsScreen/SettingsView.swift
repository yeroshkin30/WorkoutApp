//
//  SettingsView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 18.06.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {

            Text("Settings".uppercased())
                .font(.system(size: 32))
                .foregroundStyle(Color.white)
                .padding()

            VStack(spacing: 0){
                SettingsRow(image: Image(.privacyPolicy), text: "Privacy Policy")
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal, 16)
                SettingsRow(image: Image(.termOfUse), text: "Privacy Policy")
            }
            .background(.rowBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .background(.backgroundMain)
    }
}

#Preview {
    SettingsView()
}


struct SettingsRow: View {
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



