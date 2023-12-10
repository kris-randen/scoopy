//
//  QuartersNotifyView.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import SwiftUI
import Combine

struct QuartersNotifyView: View {
    @ObservedObject var viewModel: ActivityViewModel
    @State private var currentDate = Date()
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Quarter \(viewModel.currentQuarterIndex) just elapsed.")
            Text("Quarters Left: \(viewModel.quartersLeft)")
        }
        .onReceive(timer, perform: { input in
            currentDate = input
            viewModel.updateCurrentQuarterIndex(from: currentDate)
        })
        .onAppear {
            viewModel.updateCurrentQuarterIndex()
        }
    }
}

#Preview {
    QuartersNotifyView(viewModel: ActivityViewModel())
}
