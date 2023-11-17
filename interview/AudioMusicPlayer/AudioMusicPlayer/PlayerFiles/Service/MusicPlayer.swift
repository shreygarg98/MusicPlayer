//
//  MusicPlayer.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import Foundation
import AVFoundation

class MusicPlayer{
    static let shared = MusicPlayer()
    private var player: AVPlayer?
    private var playlist:[MusicTrackModel] = [MusicTrackModel]()
    private var currentIndex  = 0
    
    private init() {}
    
    func loadPlaylist(_ tracks: [MusicTrackModel]){
        playlist = tracks
    }
    
    func playTrack(at index: Int){
        guard index >= 0 && index < playlist.count else {return}
        currentIndex = index
        guard let songUrl = URL(string: playlist[index].url) else {return}
        let playerItem = AVPlayerItem(url: songUrl)
        player = AVPlayer(playerItem: playerItem)
        player?.play()
    }
    
    func play(){
        player?.play()
    }
    
    func pause(){
        player?.pause()
    }
    
    func playNext(){
        if currentIndex < playlist.count - 1 {
            playTrack(at: currentIndex + 1)
        }
    }
    
    func playPrevious(){
        if currentIndex > 0 {
            playTrack(at: currentIndex - 1)
        }
    }
}
