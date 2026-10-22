//
//  ModelInfoView.swift
//  studentStressAnalysis
//
//  Created by Matt Julian Tiang on 5/19/26.
//


import SwiftUI

struct ModelInfoView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Model Details")) {
                    InfoRow(title: "Algorithm", value: "Scikit-Learn Classifier")
                    InfoRow(title: "Format", value: "Apple Core ML (.mlmodel)")
                    InfoRow(title: "Target Output", value: "Stress Level Classification")
                }
                
                Section(header: Text("Model Inputs (Features)")) {
                    Label("Study Hours (Numeric)", systemImage: "book")
                    Label("Sleep Hours (Numeric)", systemImage: "moon.zzz")
                    Label("Social Media Hours (Numeric)", systemImage: "iphone")
                    Label("Exam Score (Numeric)", systemImage: "graduationcap")
                }
                
                Section(header: Text("Model Outputs (Classes)")) {
                    Label("High Stress", systemImage: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                    Label("Medium Stress", systemImage: "minus.circle.fill")
                        .foregroundColor(.orange)
                    Label("Low Stress", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
                
                Section(header: Text("About")) {
                    Text("This model was trained on a balanced dataset of 100 students to identify correlations between lifestyle habits, academic performance, and overall stress levels.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Model Information")
        }
    }
}

struct InfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    ModelInfoView()
}
