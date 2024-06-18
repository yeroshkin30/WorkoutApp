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

            Text("SETTINGS")
                .font(.system(size: 32))
                .foregroundStyle(Color.white)
                .padding()
            Rectangle()
                .fill(Color.white)
                .frame(height: 1)
            List {
                SettingsRow(image: Image("leaf"), text: "Privacy Policy")
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                SettingsRow(image: Image("leaf"), text: "Privacy Policy")
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

            }
            .listStyle(.plain)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .background(Color.backgroundMain)
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
        .background(.rowBackground)
    }
}



