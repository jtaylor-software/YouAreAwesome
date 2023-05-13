//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeremy Taylor on 5/12/23.
//

import SwiftUI

struct ContentView: View {
  @State private var messageString = ""
  
  var body: some View {
    VStack {
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundColor(.red)
        .padding()
      
      HStack {
        Button("Awesome") {
          // Performed when button is pressed
          messageString = "You Are Awesome!"
        }
        .buttonStyle(.borderedProminent)
        
        Button("Great") {
          messageString = "You Are Great!"
        }
        .buttonStyle(.borderedProminent)
      }
      
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
