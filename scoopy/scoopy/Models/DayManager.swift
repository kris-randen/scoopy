//
//  DayManager.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import Foundation

class DayManager {
    var quarters: [Quarter] = []
    
    func generateQuarters(from wakeUpTime: Date) {
        quarters.removeAll()
        
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
            createQuarter(at: $0, from: firstQuarterStart, using: calendar)
        }
    }
    
    private func createQuarter(at index: Int, from startTime: Date, using calendar: Calendar) -> Quarter? {
        guard let quarterStart = calendar.date(byAdding: .minute, value: index * Constants.NUM_QUARTERS_IN_AN_HOUR, to: startTime) else { return nil }
        let quarterEnd = calendar.date(byAdding: .minute, value: Constants.NUM_MINS_IN_A_QUARTER - 1, to: quarterStart)!
        return Quarter(index: index + 1, startTime: quarterStart, endTime: quarterEnd)
    }
}
