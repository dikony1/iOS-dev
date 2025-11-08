//
//  ViewController.swift
//  iOS_MusicPlayer
//
//  Created by Dinara on 08.11.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func configureSongs() {
        songs.append(Song(name: "Salvatore",
                          albumName: "fall in love",
                          artistName: "Lana Del Rey",
                          imageName: "cover 1",
                          trackName: "Lana Del Rey - Salvatore"))
        
        songs.append(Song(name: "Lovers",
                          albumName: "fall in love",
                          artistName: "Anna of the North",
                          imageName: "cover 2",
                          trackName: "Anna of the North - Lovers"))
        
        songs.append(Song(name: "I'll Do It",
                          albumName: "fall in love",
                          artistName: "Heidi Montag",
                          imageName: "cover 5",
                          trackName: "Heidi Montag - Ill Do It"))
        
        songs.append(Song(name: "Skyfall",
                          albumName: "fall in love",
                          artistName: "Adele",
                          imageName: "cover 3 ",
                          trackName: "Adele - Skyfall"))
        
        
        songs.append(Song(name: "Timeless",
                          albumName: "fall in love",
                          artistName: "The Weeknd",
                          imageName: "cover 4",
                          trackName: "The Weeknd - Timeless"
                         ))
        
    
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //config
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.porition = position
        
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}

