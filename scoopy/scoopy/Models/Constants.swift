//
//  Constants.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import Foundation

struct Constants {
    static let NUM_HOURS_IN_A_DAY = 24
    static let NUM_MINS_IN_AN_HOUR = 60
    static let NUM_SECS_IN_A_MIN = 1
    static let NUM_SECS_IN_AN_HOUR = NUM_SECS_IN_A_MIN * NUM_MINS_IN_AN_HOUR
    static let NUM_MINS_IN_A_QUARTER = NUM_MINS_IN_AN_HOUR / 4
    static let NUM_SECS_IN_A_QUARTER = NUM_MINS_IN_A_QUARTER * NUM_SECS_IN_A_MIN
    
    static let TIME_SECS_IN_A_MIN = TimeInterval(NUM_SECS_IN_A_MIN)
    static let TIME_SECS_IN_A_QUARTER = TimeInterval(NUM_SECS_IN_A_QUARTER)
    static let TIME_SECS_IN_AN_HOUR = TimeInterval(NUM_SECS_IN_AN_HOUR)
    
    static let NUM_QUARTERS_IN_AN_HOUR = NUM_MINS_IN_AN_HOUR / NUM_MINS_IN_A_QUARTER
    static let NUM_QUARTERS_IN_A_DAY = NUM_HOURS_IN_A_DAY * NUM_QUARTERS_IN_AN_HOUR
    static let RANGE_OF_QUARTERS_IN_A_DAY = 0..<NUM_QUARTERS_IN_A_DAY
}
