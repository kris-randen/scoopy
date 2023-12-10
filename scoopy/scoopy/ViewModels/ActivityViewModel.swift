//
//  ActivityViewModel.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import Foundation
import Combine

class ActivityViewModel: ObservableObject {
    @Published private(set) var userActivity: UserActivity {
        didSet {
            UserDefaults.standard.saveActivity(userActivity)
            updateQuarters()
        }
    }
    @Published var currentQuarterIndex = 0
    @Published var quartersLeft = Constants.NUM_QUARTERS_IN_A_DAY
    private var dayManager = DayManager()
//    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.userActivity = UserDefaults.standard.getActivity() ?? UserActivity()
        updateQuarters()
//        Timer.publish(every: 1, on: .main, in: .common)
//                    .autoconnect()
//                    .sink { [weak self] _ in
//                        self?.updateCurrentQuarterIndex()
//                    }
//                    .store(in: &cancellables)
    }
    
    func registerWakeUpTime() {
        updateUserActivity(wakeUpTime: Date.now)
        updateQuarters()
    }
    
    func updateCurrentQuarterIndex(from date: Date = Date.now) {
        guard let wakeUpTime = userActivity.wakeUpTime else {
            refresh()
            return
        }
        
        let calendar = Calendar.current
        let wakeUpComponents = calendar.dateComponents([.hour, .minute], from: wakeUpTime)
        let currentComponents = calendar.dateComponents([.hour, .minute], from: date)
        
        let wakeUpMinutes = (wakeUpComponents.hour ?? 0) * Constants.NUM_MINS_IN_AN_HOUR + (wakeUpComponents.minute ?? 0)
        let currentMinutes = (currentComponents.hour ?? 0) * Constants.NUM_MINS_IN_AN_HOUR + (currentComponents.minute ?? 0)
        
        let elapsedMinutes = currentMinutes - wakeUpMinutes
        
        guard elapsedMinutes >= 0 else {
            // It's before wake up time
            refresh()
            return
        }
        
        DispatchQueue.main.async {
            self.currentQuarterIndex = (elapsedMinutes / Constants.NUM_MINS_IN_A_QUARTER) + 1
            self.quartersLeft = max(Constants.NUM_QUARTERS_IN_A_DAY - self.currentQuarterIndex, 0)
        }
    }
    
    func updateUserActivity(wakeUpTime: Date? = nil, sleepTime: Date? = nil) {
        // Update wake-up and sleep times if recorded already
        if let wakeUpTime = wakeUpTime { userActivity.wakeUpTime = wakeUpTime }
        if let sleepTime = sleepTime { userActivity.sleepTime = sleepTime }
    }
    
    func quarters() -> [Quarter] { return dayManager.quarters }
    
    private func updateQuarters() {
        dayManager.generateQuarters(from: userActivity.wakeUpTime)
    }
    
    private func refresh() {
        currentQuarterIndex = 0
        quartersLeft = Constants.NUM_QUARTERS_IN_A_DAY
    }
}
