//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeremy Taylor on 5/12/23.
//

import SwiftUI

struct ContentView: View {
  @State private var messageString = ""
  @State private var imageName = ""
  @State private var lastMessageNumber = -1
  @State private var lastImageNumber = -1
  
  var body: some View {
    VStack {
      Text(messageString)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .minimumScaleFactor(0.5)
        .multilineTextAlignment(.center)
        .foregroundColor(.red)
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .padding()
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .cornerRadius(30)
        .shadow(radius: 30)
        .padding()
      
      Spacer()
      
      Button("Show Message") {
        // Performed when button is pressed
        let messages = [
          "You Are Awesome!",
          "You Are Great!",
          "You Are Fantastic!",
          "Fabulous? That's You!",
          "You Make Me Smile!",
          "When the Genius Bar Needs Help, They Call You!"
        ]
        
        var messageNumber: Int
        repeat {
          messageNumber = Int.random(in: 0...messages.count-1)
        } while messageNumber == lastMessageNumber
        messageString = messages[messageNumber]
        lastMessageNumber = messageNumber
        
        var imageNumber: Int
        repeat {
          imageNumber = Int.random(in: 0...9)
        }  while imageNumber == lastImageNumber
        imageName = "image\(imageNumber)"
        lastImageNumber = imageNumber
        
      }
      .buttonStyle(.borderedProminent)
      
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
