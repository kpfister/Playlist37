//
//  SongListTableViewController.swift
//  PlaylistCoredata
//
//  Created by Cameron Stuart on 11/11/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    @IBOutlet weak var sontTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createSongButtonTapped(_ sender: Any) {
        guard let playlist = playlist,
              let songTitle = sontTitleTextField.text, !songTitle.isEmpty,
              let artistName = artistNameTextField.text, !artistName.isEmpty else { return }
              
        SongController.createSong(songTitle: songTitle, artistName: artistName, playlist: playlist)
        sontTitleTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let playlist = playlist,
              let song = playlist.songs?[indexPath.row] as? Song else { return UITableViewCell() }
        cell.textLabel?.text = song.songTitle
        cell.detailTextLabel?.text = song.artistName

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist,
                  let songToDelete = playlist.songs?[indexPath.row] as? Song else { return }
            SongController.deleteSong(song: songToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
