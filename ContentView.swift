//
//  ContentView.swift
//  CS50_Final_Project
//
//  Created by Katherine Gilligan on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Capsule", "Rectangle", "Oval", "Triangle", "Octagon", "Heart", "Hexagon", "Seal" ]
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    
    @State private var selected = "Heart"
    
    @State private var id = 1
    
    var body: some View {
        VStack {
            Text("CS50 Final Project @GillyGooms")
                .font(.largeTitle.bold())
            
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .transition(.slide)
                    .id(id)
                    .overlay(
                        Image(systemName:
                            "\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    )
                
                Text("\(selected)!")
                    .font(.title)
            }
            
            Spacer()
            
            Button("Try again") {
                //change activity
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "Hexagon"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
