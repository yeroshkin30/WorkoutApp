//
//  TabBarButton.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 18.06.2024.
//

import SwiftUI

var tabItems = ["Workout","Settings"]

struct Home : View {

    @State var selected = "Workout"

    init() {

        UITabBar.appearance().isHidden = true
    }

    var body: some View{

        VStack(spacing: 0) {
            TabView(selection: $selected) {

                Color.red
                    .tag(tabItems[0])
                    .ignoresSafeArea(.all, edges: .top)

                SettingsView()
                    .tag(tabItems[1])
                    .ignoresSafeArea(.all, edges: .top)
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack(alignment: .top, spacing: 0) {

                TabBarButton(selected: $selected, image: Image(.workoutIcon), name: "Workout")
                    .frame(maxWidth: .infinity)
                Button {

                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color.customRed)
                }

                TabBarButton(selected: $selected, image: Image(.settingsIcon), name: "Settings")
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 57, alignment: .bottom)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            .background(Color.rowBackground)
        }
        .sheet(isPresented: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is Presented@*/.constant(false)/*@END_MENU_TOKEN@*/, content: {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
        })
    }
}


#Preview(body: {
    Home()
})

struct TabBarButton: View {
    @Binding var selected: String
    let image: Image
    let name: String

    var body: some View {
        Button(action: {
            selected = name
        }, label:  {

            VStack(spacing: 8) {
                image
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(selected == name ? Color.customRed : .gray)
                Text(name)
                    .font(.caption)
                    .foregroundColor(selected == name ? Color.customRed : .gray)
            }
        })
    }
}
