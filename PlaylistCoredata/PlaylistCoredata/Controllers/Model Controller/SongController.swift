//
//  SongController.swift
//  PlaylistCoredata
//
//  Created by Cameron Stuart on 11/11/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation

class SongController {
    
    // creatSong
    static func createSong(songTitle: String, artistName: String, playlist: Playlist) {
        _ = Song(songTitle: songTitle, artistName: artistName, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    // deleteSong
    static func deleteSong(song: Song) {
        song.managedObjectContext?.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
}
