//
//  DayManager.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import Foundation

class DayManager {
    var quarters: [Quarter] = []
    
    func generateQuarters(from wakeUpTime: Date?) {
        quarters.removeAll()
        
        guard let wakeUpTime = wakeUpTime else { return }
        
        // Calculate the start of the first quarter
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        
        let minute = calendar.component(.minute, from: wakeUpTime)
        let quarterIndex = minute / 15
        let startMinute = quarterIndex * 15
        
        guard let firstQuarterStart = calendar.date(
            bySettingHour: calendar.component(.hour, from: wakeUpTime),
            minute: startMinute,
            second: 0,
            of: wakeUpTime) else { return }
        
        // Generate 96 quarters 15 mins each
        quarters = Constants.RANGE_OF_QUARTERS_IN_A_DAY.compactMap {
            Quarter.create(at: $0, from: firstQuarterStart, using: calendar)
        }
        
        print("Quarters = \(quarters)")
    }
}
