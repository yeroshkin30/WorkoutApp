import SwiftUI

struct WorkoutView: View {
    var body: some View {
        Text("Workout View")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}

struct AddView: View {
    var body: some View {
        Text("Add View")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}


struct ContentsView: View {
    @State private var selectedIndex = 0

    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                WorkoutView()
                    .tabItem {
                        VStack {
                            Image(selectedIndex == 0 ? .workoutIconColored: .workoutIcon)
                            Text("Workout")
                                .font(.system(size: 10))
                        }
                    }
                    .tag(0)

                AddView()
                    .tabItem {
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 40))
                        }
                    }
                    .tag(1)

                SettingsView()
                    .tabItem {
                        VStack(spacing: 20) {
                            Image(selectedIndex == 2 ? .settingsIconColored : .settingsIcon)
                            Text("Settings")
                                .font(.system(size: 10))
                                .foregroundStyle(selectedIndex == 2 ? Color.customRed : Color.gray)
                                .foregroundStyle(Color(.red))
                                .foregroundColor(.red)
                        }
                    }
                    .tag(2)
            }

            // Custom middle button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        selectedIndex = 1
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.red)
                            .background(Color.black.clipShape(Circle()))
                    }
                    .offset(y: -20)
                    Spacer()
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}
