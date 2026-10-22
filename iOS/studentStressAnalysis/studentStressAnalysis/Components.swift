//
//  InputField.swift
//  studentStressAnalysis
//
//  Created by Matt Julian Tiang on 5/19/26.
//

import SwiftUI
import Charts

struct InputField: View {
    var label: String
    @Binding var value: String
    var icon: String
    var color: Color
    var maxVal: Double
    
    var isInvalid: Bool {
        if value.isEmpty { return false }
        guard let num = Double(value) else { return true }
        return num < 0 || num > maxVal
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 25)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.subheadline)
                
                Text("Range: 0 - \(Int(maxVal))")
                    .font(.caption2)
                    .foregroundColor(isInvalid ? .red : .secondary)
            }
            
            Spacer()
            
            TextField("0.0", text: $value)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .frame(width: 80)
                .multilineTextAlignment(.center)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isInvalid ? Color.red : Color.clear, lineWidth: 1)
                )
        }
    }
}

struct MetricBarView: View {
    var title: String
    var value: Double
    var max: Double
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(value, specifier: "%.1f")")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Chart {
                BarMark(
                    x: .value("Value", min(value, max))
                )
                .foregroundStyle(color.gradient)
                .cornerRadius(4)
            }
            .chartXScale(domain: 0...max)
            .frame(height: 20)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}

