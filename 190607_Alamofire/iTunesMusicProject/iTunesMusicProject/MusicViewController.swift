//
//  ViewController.swift
//  iTunesMusicProject
//
//  Created by Fury on 07/06/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import Alamofire

class MusicViewController: UIViewController {
    private var url = "https://itunes.apple.com/search?media=music&entity=song&term=*"
    
    var allMusicData: [MusicData] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private let musicTableView: UITableView = {
        let musicTableView = UITableView()
        musicTableView.translatesAutoresizingMaskIntoConstraints = false
        return musicTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchController()
        configure()
        addSubView()
        autoLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    private func getData() {
        let req = AF.request(url)
        req
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let musicData = try JSONDecoder().decode(Music.self, from: data)
                    self.allMusicData = musicData.results
                    DispatchQueue.main.async {
                        self.musicTableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setUpSearchController(){
        // Setup Basic SearchController Setting
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        searchController.searchBar.sizeToFit()
        
        // Setup other SearchController Setting
        searchController.searchBar.placeholder = "Search Songs"
        // 검색할때 뒷 화면을 흐리게 표현할것인지
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func configure() {
        musicTableView.rowHeight = 80
        musicTableView.dataSource = self
        musicTableView.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.identifier)
    }

    private func addSubView() {
        view.addSubview(musicTableView)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            musicTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            musicTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            musicTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            musicTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }

}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMusicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as! MusicTableViewCell
        let urlStr = allMusicData[indexPath.row].artworkUrl100
        let url = URL(string: urlStr)!
        let req = AF.request(url)
        req
        .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    cell.musicImage.image = UIImage(data: data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        
        cell.artistName.text = allMusicData[indexPath.row].artistName
        cell.musicName.text = allMusicData[indexPath.row].trackName
        
        return cell
    }
}

extension MusicViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        url = "https://itunes.apple.com/search?media=music&entity=song&term=" + text
        getData()
    }
}
