//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by tomek on 14/06/2022.
//

import SwiftUI

struct ContentView: View {
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var countries = ["Estonia", "France", "Monaco", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0..<3)
  @State private var message = ""
  @State private var score = 0
  
  var body: some View {
    ZStack {
      RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
      ], center: .top, startRadius: 200, endRadius: 400)
      .ignoresSafeArea()
      
      VStack {
        VStack(spacing: 15) {
          Spacer()
          Text("Guess the Flag")
            .font(.largeTitle.bold())
            .foregroundColor(.white)
          
          VStack {
            Text("Tap the flag of")
              .font(.subheadline.weight(.heavy))
              .foregroundColor(.secondary)
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
          }
          
          ForEach(0..<3) { number in
            Button {
              flagTapped(number)
              
            } label: {
              Image(countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }
          }
          
          Spacer()
          Spacer()
          Text("Score: \(score)")
            .foregroundColor(.white)
            .font(.title.bold())
          Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
      }
      .padding(10)
    }
    .alert(scoreTitle, isPresented: $showingScore) {
      Button("Continue", action: askQuestion)
    } message: {
      Text(message)
      Text("Your score is \(score)")
    }
  }
  
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
      message = ""
      score += 1
    } else {
      scoreTitle = "Wrong"
      message = "That's the flag of \(countries[correctAnswer])"
    }
    
    showingScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0..<3)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
