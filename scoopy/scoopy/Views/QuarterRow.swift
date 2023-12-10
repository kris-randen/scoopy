//
//  QuarterRow.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import SwiftUI

struct QuarterRow: View {
    var quarter = Quarter.create()!
    
    var body: some View {
        HStack {
            Text("Quarter \(quarter.index)")
                .font(.headline)
            Spacer()
            VStack(alignment: .trailing) {
                Text("Start: \(formatDate(quarter.startTime))")
                Text("End: \(formatDate(quarter.endTime))")
            }
        }
        .padding()
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    QuarterRow()
}
