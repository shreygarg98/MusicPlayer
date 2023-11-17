//
//  ViewController.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let musicViewController = MusicViewController()
        self.addChild(musicViewController)
        view.addSubview(musicViewController.view)
        musicViewController.view.frame = view.bounds
    }


}

