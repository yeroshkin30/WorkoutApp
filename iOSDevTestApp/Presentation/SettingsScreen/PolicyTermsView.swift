//
//  PolicyTermsView.swift
//  iOSDevTestApp
//
//  Created by Oleh Yeroshkin on 26.06.2024.
//

import SwiftUI

struct PolicyTermsView: View {
    @Environment(\.dismiss) var dismiss

    let text: String

    var body: some View {
        ScrollView {
            Text(text)
                .padding()
                .foregroundStyle(.white)
        }
        .background(
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        .background(.backgroundMain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton {
                    dismiss()
                }
            }
        }
    }
}
