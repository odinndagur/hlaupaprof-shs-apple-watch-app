//
//  hktestApp.swift
//  hktest WatchKit Extension
//
//  Created by Óðinn Dagur Bjarnason on 31.12.2021.
//

//import SwiftUI
//
//@main
//struct hktestApp: App {
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                ContentView()
//            }
//        }
//    }
//}


import SwiftUI

@main
struct hktestApp: App {
    @StateObject private var workoutManager = WorkoutManager()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)
        }
    }
}
