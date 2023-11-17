//
//  MusicService.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import Foundation

enum NetworkError: Error{
    case invalidUrl
    case noData
}
class MusicService{
    func fetchMusic(completion: @escaping(Result<[MusicTrackModel],Error>) -> Void){
        guard let url = URL(string: "https://exampleMusicList.com/fetchList") else{
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url){ data,response,error in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let data = data else{
                completion(.failure(NetworkError.noData))
                return
            }
            do{
                let track = try JSONDecoder().decode(SongListResponse.self, from: data)
                completion(.success(track.music))
            }catch{
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
    
}
