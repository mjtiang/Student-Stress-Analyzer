//
//  WelcomeView.swift
//  studentStressAnalysis
//
//  Created by Matt Julian Tiang on 5/19/26.

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 70))
                    .foregroundStyle(
                        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            }
            
            VStack(spacing: 12) {
                Text("Student Stress Analyzer")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text("Understand how your study habits, sleep, and social media use impact your stress levels.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
            }
            .padding()
            
            Spacer()
            
            // Updated destination to MainTabView
            NavigationLink(destination: MainTabView()) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(colors: [.blue, .indigo], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(15)
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
        }
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}

#Preview {
    WelcomeView()
}
