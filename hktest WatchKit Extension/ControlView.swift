//
//  ControlView.swift
//  hktest WatchKit Extension
//
//  Created by Óðinn Dagur Bjarnason on 1.1.2022.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    func laps() -> String {
        let time = workoutManager.builder!.elapsedTime
        return String(Int((time/53).rounded(.towardZero))) + "/15"
    }
    
    func lapDouble() -> Double {
        let time = workoutManager.builder!.elapsedTime
        return (time/53).rounded(.towardZero)
    }
    func timeRemaining() -> Double {
        let time = workoutManager.builder!.elapsedTime
        let total: Double = 795
        return (total-time)
    }

    var body: some View {
        VStack{
            VStack() {
                HStack{
                    Text(laps() + " hringir")
                        .foregroundColor(.white)
                }
            HStack {
                VStack {
                    Button {
                        workoutManager.endWorkout()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.red)
                    .font(.title2)
                    Text("End")
                }
                VStack {
                    Button {
                        workoutManager.togglePause()
                    } label: {
                        Image(systemName: workoutManager.running ? "pause" : "play")
                    }
                    .tint(.yellow)
                    .font(.title2)
                    Text(workoutManager.running ? "Pause" : "Resume")
                }
            }
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView().environmentObject(WorkoutManager())
    }
}
}
