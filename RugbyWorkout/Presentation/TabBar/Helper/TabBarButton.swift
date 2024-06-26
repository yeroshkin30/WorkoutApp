//
//  TabBarButton.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 18.06.2024.
//

import SwiftUI

struct TabBarButton: View {
    @Binding var selected: TabBarItem
    let item: TabBarItem

    var body: some View {
        Button(action: {
            selected = item
        }, label:  {

            VStack(spacing: 8) {
                item.image
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(selected == item ? Color.customRed : .gray)
                Text(item.name)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(selected == item ? Color.customRed : .gray)
            }
        })
    }
}
