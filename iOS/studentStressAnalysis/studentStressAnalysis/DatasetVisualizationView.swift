//
//  DatasetVisualizationView.swift
//  studentStressAnalysis
//
//  Created by Matt Julian Tiang on 5/19/26.
//

import SwiftUI
import Charts

struct DatasetVisualizationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Stress Level Distribution")
                            .font(.headline)
                        Text("Based on 100 recorded students")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Chart {
                            SectorMark(angle: .value("Count", 34), innerRadius: .ratio(0.5), angularInset: 1.5)
                                .foregroundStyle(.red)
                                .annotation(position: .overlay) { Text("High\n34%").font(.caption).bold().foregroundColor(.white) }
                            
                            SectorMark(angle: .value("Count", 33), innerRadius: .ratio(0.5), angularInset: 1.5)
                                .foregroundStyle(.orange)
                                .annotation(position: .overlay) { Text("Med\n33%").font(.caption).bold().foregroundColor(.white) }
                            
                            SectorMark(angle: .value("Count", 33), innerRadius: .ratio(0.5), angularInset: 1.5)
                                .foregroundStyle(.green)
                                .annotation(position: .overlay) { Text("Low\n33%").font(.caption).bold().foregroundColor(.white)
                                }
                        }
                        .frame(height: 200)
                    }
                    .modifier(CardModifier())
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Dataset Averages")
                            .font(.headline)
                        
                        Chart {
                            BarMark(x: .value("Category", "Study (hrs)"), y: .value("Average", 3.5))
                                .foregroundStyle(.blue)
                            BarMark(x: .value("Category", "Sleep (hrs)"), y: .value("Average", 6.0))
                                .foregroundStyle(.indigo)
                            BarMark(x: .value("Category", "Social (hrs)"), y: .value("Average", 3.8))
                                .foregroundStyle(.cyan)
                        }
                        .frame(height: 200)
                        
                        Text("Average Exam Score: 64.35")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 5)
                    }
                    .modifier(CardModifier())
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Dataset Insights")
        }
    }
}


#Preview {
    DatasetVisualizationView()
}
