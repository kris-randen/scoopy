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
    static let NUM_SECS_IN_A_MIN = 60
    static let NUM_MINS_IN_A_QUARTER = 15
    
    static let NUM_QUARTERS_IN_AN_HOUR = NUM_MINS_IN_AN_HOUR / NUM_MINS_IN_A_QUARTER
    static let NUM_QUARTERS_IN_A_DAY = NUM_HOURS_IN_A_DAY * NUM_QUARTERS_IN_AN_HOUR
    static let RANGE_OF_QUARTERS_IN_A_DAY = 0..<NUM_QUARTERS_IN_A_DAY
}
