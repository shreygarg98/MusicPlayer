//
//  MusicTrackModel.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import Foundation

struct SongListResponse: Codable{
    let music:[MusicTrackModel]
}

struct MusicTrackModel: Codable{
    let title: String
    let album: String
    let duration: Int
    let url: String
}
