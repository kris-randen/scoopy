//
//  QuartersView.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import SwiftUI

struct QuartersView: View {
    @ObservedObject var viewModel: ActivityViewModel
    
    var body: some View {
        List(viewModel.quarters()) {
            quarter in
            QuarterRow(quarter: quarter)
        }
    }
}

#Preview {
    QuartersView(viewModel: ActivityViewModel())
}
