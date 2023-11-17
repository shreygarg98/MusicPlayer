//
//  MusicViewController.swift
//  AudioMusicPlayer
//
//  Created by Shrey Garg on 17/11/23.
//

import UIKit


class MusicViewController: UIViewController{
    var tableView: UITableView!
    let viewModel = MusicViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        addListener()
        fetchData()
    }
    
    func setUpTableView(){
        tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MusicListTableCell")
        view.addSubview(tableView)
    }
    
    func addListener(){
        viewModel.onMusicFetched = {[weak self] in
            guard let self = self else {return}
            MusicPlayer.shared.loadPlaylist(self.viewModel.tracks)
            self.tableView.reloadData()
        }
    }
    func fetchData(){
        viewModel.fetchMusic()
    }
}
//  TableViewDelegates
extension MusicViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListTableCell", for: indexPath)
        let track = viewModel.tracks[indexPath.row]
        cell.textLabel?.text = "\(track.title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //show next Screen
        let playerVC  = PlayerViewController()
        playerVC.track = viewModel.tracks[indexPath.row]
        navigationController?.pushViewController(playerVC, animated: true)
    }
    
}
