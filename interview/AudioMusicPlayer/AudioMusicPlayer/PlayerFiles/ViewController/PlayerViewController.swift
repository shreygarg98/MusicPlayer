//
//  PlayerViewController.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController{
    var stackView = UIStackView()
    let playPauseButton = UIButton()
    let nextButton = UIButton()
    let previousButton = UIButton()
    
    var track: MusicTrackModel?
    var player: AVPlayer?
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpButtons()
        setUpButtonConstraints()
        loadMusicTrack()
    }
    
    func setUpButtons(){
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        playPauseButton.setTitle("Play", for: .normal)
        playPauseButton.setTitleColor(.blue, for: .normal)
        playPauseButton.addTarget(self, action: #selector(playPauseButtonClickAction), for: .touchUpInside)
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.setTitle("Previous", for: .normal)
        previousButton.setTitleColor(.blue, for: .normal)
        previousButton.addTarget(self, action: #selector(playPreviousButtonClickAction), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(playNextButtonClickAction), for: .touchUpInside)
    }
    
    func setUpButtonConstraints(){
        stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        [previousButton,playPauseButton,nextButton].forEach({ stackView.addArrangedSubview($0)})
        
    }
    
    @objc func playPauseButtonClickAction(){
        isPlaying.toggle()
        if isPlaying{
            player?.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }else{
            player?.pause()
            playPauseButton.setTitle("Play", for: .normal)
        }
    }
    
    @objc func playPreviousButtonClickAction(){
        MusicPlayer.shared.playPrevious()
    }
    
    @objc func playNextButtonClickAction(){
        MusicPlayer.shared.playNext()
    }
    
    func loadMusicTrack(){
        guard let track = track, let url = URL(string: track.url) else{return}
        player = AVPlayer(url: url)
    }
}
