//
//  RemoteAudioView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-21.
//

import AVKit
import SwiftUI

// CITATION: Adapted from https://medium.com/swift-productions/swiftui-play-an-audio-with-avaudioplayer-1c4085e2052c

/// Attempts to synchronously load an audio file at the provided URL and show basic player controls; do not use this view to load many audio files within an app at the same time (e.g.: as part of a list), otherwise, there may be noticeable lag in the user interface. This implementation does not monitor the AVPlayerItem instance to see if the remote media loaded successfully.
struct RemoteAudioView: View {
    
    // MARK: Stored properties
    
    // The address of the remote audio file to load
    var audioUrl: String
    
    // An AVPlayer instance that will play the audio file
    @State var audioPlayer: AVPlayer = AVPlayer()
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Show a horizontal list of audio controls
            HStack {
                
                Spacer()
                
                Button(action: {
                    audioPlayer.play()
                }) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                Button(action: {
                    audioPlayer.pause()
                }) {
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }

                Spacer()
            }
            
        }
        .onAppear {
            
            // Create a URL instance from the audio file URL
            if let url = URL(string: audioUrl) {
                
                // Tell the AVPlayerItem instance what audio asset it will play
                let playerItem = AVPlayerItem(url: url)
                                
                // Attach the item to an AVPlayer instance that will allow for playback control to occur (start, pause, stop)
                audioPlayer = AVPlayer(playerItem: playerItem)
                                
                // Set the volume
                audioPlayer.volume = 0.5
                
            }
            
        }
        .onDisappear() {
            audioPlayer.pause()
        }
    }
    
}

struct RemoteAudioView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Example of an audio file that should load successfully
        RemoteAudioView(audioUrl: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/4d/80/bb/4d80bb0d-5b66-7c09-056c-4dbae131e0c4/mzaf_6323814923022681502.plus.aac.p.m4a")
        
    }
}
