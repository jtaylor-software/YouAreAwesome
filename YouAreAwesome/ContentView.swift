//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeremy Taylor on 4/21/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var message = ""
  @State private var imageName = ""
  @State private var lastMessageNumber = -1
  @State private var lastImageNumber = -1
  @State private var lastSoundNumber = -1
  @State private var audioPlayer: AVAudioPlayer!
  
  let numberOfImages = 10
  let numberofSounds = 5
  
  var body: some View {
    VStack {
      Text(message)
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundStyle(.red)
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.5)
        .frame(height: 130)
        .animation(.easeInOut(duration: 0.15), value: message)
      
      Spacer()
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(radius: 30)
        .animation(.default, value: imageName)
      
      Spacer()
      
      Button("Show Message") {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "Fabulous? That's You!",
                        "You Make Me Smile!",
                        "When The Genius Bar Needs Help, They Call You!"]
        
        lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count - 1)
        message = messages[lastMessageNumber]
        
        lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages - 1)
        imageName = "image\(lastImageNumber)"
        
        lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberofSounds - 1)
        playsound(soundName: "sound\(lastSoundNumber)")
      }
      .buttonStyle(.borderedProminent)
      .font(.title2)
    }
    .padding()
  }
  
  func playsound(soundName: String) {
    guard let soundFile = NSDataAsset(name: soundName) else {
      print("😡 Could not read file named \(soundName)")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(data: soundFile.data)
      audioPlayer.play()
    } catch {
      print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
    }
  }
  
  func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
    var randomNumber: Int
    repeat {
      randomNumber = Int.random(in: 0...upperBound)
    } while randomNumber == lastNumber
    return randomNumber
  }
}

#Preview {
  ContentView()
}
