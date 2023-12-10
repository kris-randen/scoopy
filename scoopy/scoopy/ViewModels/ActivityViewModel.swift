//
//  ActivityViewModel.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import Foundation

class ActivityViewModel: ObservableObject {
    @Published private(set) var userActivity: UserActivity {
        didSet {
            UserDefaults.standard.saveActivity(userActivity)
            updateQuarters()
        }
    }
    
    private var dayManager = DayManager()
    
    init() {
        self.userActivity = UserDefaults.standard.getActivity() ?? UserActivity()
        updateQuarters()
    }
    
    func updateUserActivity(wakeUpTime: Date? = nil, sleepTime: Date? = nil) {
        // Update wake-up and sleep times if recorded already
        if let wakeUpTime = wakeUpTime { userActivity.wakeUpTime = wakeUpTime }
        if let sleepTime = sleepTime { userActivity.sleepTime = sleepTime }
    }
    
    private func updateQuarters() {
        dayManager.generateQuarters(from: userActivity.wakeUpTime)
    }
}
