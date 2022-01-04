//
//  StartView.swift
//  hktest WatchKit Extension
//
//  Created by Óðinn Dagur Bjarnason on 1.1.2022.
//

  import SwiftUI
  import HealthKit

  struct StartView: View {
      @EnvironmentObject var workoutManager: WorkoutManager
      var workoutType:HKWorkoutActivityType = .running

      var body: some View {
          VStack{
              NavigationLink(workoutType.name, destination: SessionPagingView(),
                             tag: workoutType, selection: $workoutManager.selectedWorkout)
                  .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
          }
          .listStyle(.carousel)
          .onAppear {
              workoutManager.requestAuthorization()
          }
      }
  }

  struct StartView_Previews: PreviewProvider {
      static var previews: some View {
          StartView().environmentObject(WorkoutManager())
      }
  }

  extension HKWorkoutActivityType: Identifiable {
      public var id: UInt {
          rawValue
      }

      var name: String {
          switch self {
          case .running:
              return "Hlaupapróf"
          case .cycling:
              return "Bike"
          case .walking:
              return "Walk"
          default:
              return ""
          }
      }
  }



//
////
////  StartView.swift
////  hktest WatchKit Extension
////
////  Created by Óðinn Dagur Bjarnason on 1.1.2022.
////
//
//  import SwiftUI
//  import HealthKit
//
//  struct StartView: View {
//      @EnvironmentObject var workoutManager: WorkoutManager
//      var workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking]
//
//      var body: some View {
//          List(workoutTypes) { workoutType in
//              NavigationLink(workoutType.name, destination: SessionPagingView(),
//                             tag: workoutType, selection: $workoutManager.selectedWorkout)
//                  .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
//          }
//          .listStyle(.carousel)
//          .navigationBarTitle("Workouts")
//          .onAppear {
//              workoutManager.requestAuthorization()
//          }
//      }
//  }
//
//  struct StartView_Previews: PreviewProvider {
//      static var previews: some View {
//          StartView().environmentObject(WorkoutManager())
//      }
//  }
//
//  extension HKWorkoutActivityType: Identifiable {
//      public var id: UInt {
//          rawValue
//      }
//
//      var name: String {
//          switch self {
//          case .running:
//              return "Run"
//          case .cycling:
//              return "Bike"
//          case .walking:
//              return "Walk"
//          default:
//              return ""
//          }
//      }
//  }
