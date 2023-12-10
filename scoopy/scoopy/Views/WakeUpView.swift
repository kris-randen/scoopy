//
//  WakeUpView.swift
//  scoopy
//
//  Created by Krishnaswami Rajendren on 12/10/23.
//

import SwiftUI

struct WakeUpView: View {
    @ObservedObject var viewModel = ActivityViewModel()
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Good Morning!")
                Button("I'm up") {
                    viewModel.registerWakeUpTime()
                    isActive = true
                }
            }
            .navigationDestination(isPresented: $isActive) {
                QuartersNotifyView(viewModel: viewModel)
            }
        }
        
    }
}

#Preview {
    WakeUpView()
}
