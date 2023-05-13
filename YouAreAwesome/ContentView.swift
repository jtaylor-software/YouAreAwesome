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
      
      Spacer()
      
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .minimumScaleFactor(0.5)
        .multilineTextAlignment(.center)
        .foregroundColor(.red)
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .padding()
      
      Spacer()
      
      
      
      
      HStack {
        Button("Awesome") {
          // Performed when button is pressed
          messageString = "You Are Awesome!"
        }
        .buttonStyle(.borderedProminent)
        
        Spacer()
        
        Button("Great") {
          messageString = "You Are Great!"
        }
        .buttonStyle(.borderedProminent)
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
