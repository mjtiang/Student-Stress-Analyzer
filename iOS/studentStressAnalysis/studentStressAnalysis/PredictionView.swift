//
//  PredictionView.swift
//  studentStressAnalysis
//
//  Created by Matt Julian Tiang on 5/19/26.
//


import SwiftUI
import CoreML

struct PredictionView: View {
    @State private var studyHours: String = ""
    @State private var sleepHours: String = ""
    @State private var socialMediaHours: String = ""
    @State private var examScore: String = ""
    
    @State private var resultLabel: String = ""

    var isInputValid: Bool {
        guard let study = Double(studyHours),
              let sleep = Double(sleepHours),
              let social = Double(socialMediaHours),
              let score = Double(examScore) else {
            return false
        }
        
        return (0...7).contains(study) &&
               (0...8).contains(sleep) &&
               (0...7).contains(social) &&
               (0...90).contains(score)
    }
    
    var liveStudy: Double { Double(studyHours) ?? 0.0 }
    var liveSleep: Double { Double(sleepHours) ?? 0.0 }
    var liveSocial: Double { Double(socialMediaHours) ?? 0.0 }
    var liveScore: Double { Double(examScore) ?? 0.0 }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Label("Enter Student Data", systemImage: "square.and.pencil")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.bottom, 5)
                        
                        InputField(label: "Study Hours", value: $studyHours, icon: "book.fill", color: .blue, maxVal: 7)
                        InputField(label: "Sleep Hours", value: $sleepHours, icon: "moon.zzz.fill", color: .indigo, maxVal: 8)
                        InputField(label: "Social Media Hours", value: $socialMediaHours, icon: "iphone", color: .cyan, maxVal: 7)
                        InputField(label: "Exam Score", value: $examScore, icon: "graduationcap.fill", color: .green, maxVal: 90)
                    }
                    .modifier(CardModifier())
                    
                    HStack(spacing: 15) {
                        Button(action: predict) {
                            Text("Predict Stress Level")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(isInputValid ? Color.blue : Color.gray.opacity(0.3))
                                .foregroundColor(isInputValid ? .white : .gray)
                                .cornerRadius(12)
                                .shadow(color: isInputValid ? .blue.opacity(0.3) : .clear, radius: 5, x: 0, y: 3)
                        }
                        .disabled(!isInputValid)

                        Button(action: resetInputs) {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.headline)
                                .padding()
                                .background(Color(.systemGray5))
                                .foregroundColor(.primary)
                                .cornerRadius(12)
                        }
                    }
                    
                    if !resultLabel.isEmpty {
                        VStack(spacing: 10) {
                            Text("Predicted Stress Level")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(resultLabel)
                                .font(.system(size: 40, weight: .heavy, design: .rounded))
                                .foregroundColor(colorForLevel(resultLabel))
                        }
                        .frame(maxWidth: .infinity)
                        .modifier(CardModifier())
                        .transition(.scale.combined(with: .opacity))
                        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: resultLabel)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Label("Live Behavior Visualizer", systemImage: "chart.bar.fill")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        MetricBarView(title: "Study", value: liveStudy, max: 7, color: .blue)
                        MetricBarView(title: "Sleep", value: liveSleep, max: 8, color: .indigo)
                        MetricBarView(title: "Social", value: liveSocial, max: 7, color: .cyan)
                        MetricBarView(title: "Score", value: liveScore, max: 90, color: .green)
                    }
                    .modifier(CardModifier())
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Prediction")
        }
    }

    func resetInputs() {
        withAnimation {
            studyHours = ""
            sleepHours = ""
            socialMediaHours = ""
            examScore = ""
            resultLabel = ""
        }
    }

    func predict() {
        let config = MLModelConfiguration()
        do {
            let model = try StressLevel(configuration: config)
            let inputs = [studyHours, sleepHours, socialMediaHours, examScore].compactMap { Double($0) }
            let inputMatrix = try MLMultiArray(shape: [4], dataType: .double)
            for (index, value) in inputs.enumerated() {
                inputMatrix[index] = NSNumber(value: value)
            }
            let modelInput = StressLevelInput(input: inputMatrix)
            let prediction = try model.prediction(input: modelInput)
            
            withAnimation { resultLabel = prediction.classLabel.capitalized }
        } catch {
            withAnimation { resultLabel = "Error" }
        }
    }
    
    func colorForLevel(_ level: String) -> Color {
        switch level.lowercased() {
        case "high": return .red
        case "medium": return .orange
        case "low": return .green
        default: return .primary
        }
    }
}

#Preview {
    PredictionView()
}
