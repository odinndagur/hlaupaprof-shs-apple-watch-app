//
//  MetricsView.swift
//  hktest WatchKit Extension
//
//  Created by Óðinn Dagur Bjarnason on 1.1.2022.
//


import SwiftUI
import HealthKit

extension Double {
    func mod() -> Double {
        return self.truncatingRemainder(dividingBy: 53)
    }
}


struct MetricsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    func laps() -> String {
        let time = workoutManager.builder!.elapsedTime
        return String(Int((time/53).rounded(.towardZero))) + "/15 laps"
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
//    func lapTimeRemaining() -> Double {
//        let lapGoal: Double = 53
//        let currentLap = lapDouble()
//        
//        let lapRemaining = lapGoal - timeRemaining().truncatingRemainder(dividingBy: (Double(lapGoal) * currentLap))
//        return lapRemaining
//    }
    
    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: workoutManager.builder?.startDate ?? Date())) { context in
            VStack(alignment: .leading) {
                ElapsedTimeView(elapsedTime: workoutManager.builder?.elapsedTime ?? 0, showSubseconds: context.cadence == .live)
                    .foregroundStyle(.white)
                Text(laps())
                    .foregroundColor(.red)
//                ElapsedTimeView(elapsedTime: timeRemaining(), showSubseconds: context.cadence == .live)
//                    .foregroundStyle(.yellow)
                //testa lap time
//                ElapsedTimeView(elapsedTime: TimeInterval(53 - (Int((15-lapDouble()) * 53) % Int(timeRemaining()))), showSubseconds: context.cadence == .live)
//                    .foregroundStyle(.yellow)
                ElapsedTimeView(elapsedTime: (Double(53) -  (Double(15-lapDouble()) * 53).truncatingRemainder(dividingBy: timeRemaining())), showSubseconds: context.cadence == .live)
                    .foregroundStyle(.yellow)
//                Text(Measurement((workoutManager.builder?.elapsedTime ?? 0).formatted(.number.precision(.fractionLength(0))))
//                        .formatted(.measurement(width: .abbreviated, usage: .workout, numberFormatStyle: .number.precision(.fractionLength(0)))))

                Text(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + "❤️")
                    .foregroundColor(.red)
//                Text(Measurement(value: workoutManager.distance, unit: UnitLength.meters).formatted(.measurement(width: .abbreviated, usage: .road)))
            }
            .font(.system(.title, design: .rounded).monospacedDigit().lowercaseSmallCaps())
            .frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea(edges: .bottom)
            .scenePadding()
        }
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView().environmentObject(WorkoutManager())
    }
}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date

    init(from startDate: Date) {
        self.startDate = startDate
        
    }

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries {
        PeriodicTimelineSchedule(from: self.startDate, by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
    }
}

func laps(seconds: Double) -> Int{
    return Int(Int(seconds) % 53)
}
