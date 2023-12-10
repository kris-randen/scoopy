//
//  Quarter.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import Foundation

struct Quarter: Identifiable, Codable {
    let id: UUID = UUID()  // Unique identifier for each quarter
    let index: Int
    let startTime: Date
    let endTime: Date
    
    static func create(at index: Int = 0, from startTime: Date = Date.now, using calendar: Calendar = Calendar.current) -> Quarter? {
        guard let quarterStart = calendar.date(byAdding: .minute, value: index * Constants.NUM_MINS_IN_A_QUARTER, to: startTime) else { return nil }
        let quarterEnd = calendar.date(byAdding: .minute, value: Constants.NUM_MINS_IN_A_QUARTER - 1, to: quarterStart)!
        return Quarter(index: index + 1, startTime: quarterStart, endTime: quarterEnd)
    }
}
