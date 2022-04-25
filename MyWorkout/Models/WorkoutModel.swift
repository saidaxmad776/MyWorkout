//
//  WorkoutModel.swift
//  MyWorkout
//
//  Created by Test on 25/04/22.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknow"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workkoutImage: Data?
    @Persisted var workoutStatus: Bool = false
    
}
