//
//  ContentView.swift
//  hktest WatchKit Extension
//
//  Created by Óðinn Dagur Bjarnason on 31.12.2021.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var workoutManager = WorkoutManager()

    var body: some View {
        Text("Hello, World!")
            .padding()
        Text("Lol")
    };

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
