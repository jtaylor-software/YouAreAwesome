//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeremy Taylor on 5/12/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var messageString = ""
  @State private var imageName = ""
  @State private var lastMessageNumber = -1
  @State private var lastImageNumber = -1
  @State private var lastSoundNumber = -1
  @State private var audioPlayer: AVAudioPlayer!
  @State private var soundIsOn = true
  
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
        .animation(.easeInOut(duration: 0.15), value: messageString)
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .cornerRadius(30)
        .shadow(radius: 30)
        .padding()
        .animation(.default, value: messageString)
      
      Spacer()
      
      HStack {
        Text("Sound On:")
          .padding()
        Toggle("", isOn: $soundIsOn)
          .labelsHidden()
          .onChange(of: soundIsOn) { _ in
            if audioPlayer != nil && audioPlayer.isPlaying {
              audioPlayer.stop()
            }
          }
          
        
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
          
          lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
          messageString = messages[lastMessageNumber]
          
          lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
          imageName = "image\(lastImageNumber)"
          
          lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
          let soundName = "sound\(lastSoundNumber)"
          if soundIsOn {
            playSound(soundName: soundName)
          }
        }
        .buttonStyle(.borderedProminent)
        
      .padding()
      }
      .tint(.accentColor)
    }
  }
  
  func playSound(soundName: String) {
    guard let soundFile = NSDataAsset(name: soundName) else {
      print("😡 Could not read file named \(soundName)")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(data: soundFile.data)
      audioPlayer.play()
    } catch {
      print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
