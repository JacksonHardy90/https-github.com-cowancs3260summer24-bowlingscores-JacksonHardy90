//
//  ContentView.swift
//  Bowling Scores
//
//  Created by Jackson Hardy on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var game1: String = ""
    @State var game2: String = ""
    @State var game3: String = ""
    @State var s: String = "0"
    @State var a: String = "0"
    @State var h: String = "0"

    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Text("Bowling Scores")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            // First Row
            HStack {
                Text("Game 1")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.yellow)
                    .accessibilityLabel("Game 1")
                TextField("Enter score", text: $game1)

                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .accessibilityLabel("game1")
                    .keyboardType(.numberPad)
            }
            
            // Second Row
            HStack {
                Text("Game 2")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.yellow)
                    .accessibilityLabel("Game 2")
                TextField("Enter score", text: $game2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .accessibilityLabel("game2")
                    .keyboardType(.numberPad)
            }
            
            // Third Row
            HStack {
                Text("Game 3")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.yellow)
                    .accessibilityLabel("Game 3")
                TextField("Enter score", text: $game3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .accessibilityLabel("game3")
                    .keyboardType(.numberPad)
            }
            
            // Button
            VStack {
                Button(action: {
                    calculateResults()

                }) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(width: 200)
                .accessibilityLabel("calculate")
            }
            
            // Results Row 1
            HStack {
                Spacer()
                Text("Series:")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.blue)
                    .accessibilityLabel("Series")
                Text("\(s)")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.blue)
                    .accessibilityLabel("series")
                Spacer()
            }
            
            // Results Row 2
            HStack {
                Spacer()
                Text("Average:")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.blue)
                    .accessibilityLabel("Average")
                Text("\(a)")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.blue)
                    .accessibilityLabel("average")
                Spacer()
            }
            
            // Results Row 3
            HStack {
                Spacer()
                Text("High:")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.blue)
                    .accessibilityLabel("High")
                Text("\(h)")
                    .frame(width: 100, alignment: .leading)
                    .background(Color.blue)
                    .accessibilityLabel("high")
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
    
     func calculateResults() {
        // Convert scores to integers
         print("Game 1: \(game1), Game 2: \(game2), Game 3: \(game3)")
         print("Series: \(s), Average: \(a), High: \(h)")
         let scores = [game1, game2, game3].compactMap { Int($0) }.filter { $0 >= 0 }
         print("Game 1: \(game1), Game 2: \(game2), Game 3: \(game3)")
         print("Series: \(s), Average: \(a), High: \(h)")
        
        guard !scores.isEmpty else {
            s = "0"
            a = "0"
            h = "0"
            return
        }
        
        // Calculate series
        let seriesTotal = scores.reduce(0, +)
        
        // Calculate average
        let avg = seriesTotal / scores.count
        
        // Find high game
        let high = scores.max() ?? 0
        
        // Update variables
         s = "\(seriesTotal)"
        a = "\(avg)"
        h = "\(high)"
         print("Game 1: \(game1), Game 2: \(game2), Game 3: \(game3)")
         print("Series: \(s), Average: \(a), High: \(h)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
