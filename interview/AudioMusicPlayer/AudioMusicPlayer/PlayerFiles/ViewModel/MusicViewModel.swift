//
//  MusicViewModel.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import Foundation

class MusicViewModel{
    private let musicService: MusicService
    var tracks = [MusicTrackModel]()
    var onMusicFetched: (()->Void)?
    
    func loadData(){
        for i in 0..<10{
            tracks.append(MusicTrackModel(title: "abc\(i)", album: "xyz", duration: 100, url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3"))
        }
    }
    
    init(musicService: MusicService = MusicService()) {
        self.musicService = musicService
    }
    
    func fetchMusic(){
        loadData()
        self.onMusicFetched?()
//        musicService.fetchMusic { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let tracks):
//                    self?.tracks = tracks
//                    self?.onMusicFetched?()
//                case .failure(let error):
//                    print(error)
//                    //show alert
//                }
//            }
//        }
    }
}
