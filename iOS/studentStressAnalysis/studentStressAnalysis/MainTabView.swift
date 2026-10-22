//
//  MainTabView.swift
//  studentStressAnalysis
//
//  Created by Matt Julian Tiang on 5/19/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            PredictionView()
                .tabItem {
                    Label("Predict", systemImage: "sparkles")
                }
            
            DatasetVisualizationView()
                .tabItem {
                    Label("Dataset", systemImage: "chart.bar.xaxis")
                }
            
            ModelInfoView()
                .tabItem {
                    Label("Model Info", systemImage: "info.circle.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainTabView()
}
