//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by tomek on 14/06/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
    Button("Button 0") { }
        .tint(.blue)
    Button("Button 1") { }
      .buttonStyle(.bordered)
      .tint(.purple)
    Button("Button 2", role: .destructive) { }
      .buttonStyle(.bordered)
      .tint(.mint)
    Button("Button 3") { }
      .buttonStyle(.borderedProminent)
    Button("Button 4", role: .destructive) { }
      .buttonStyle(.borderedProminent)
      .tint(.mint)
  }
  }
  
  func executeDelete() {
    print("Now deleting…")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
