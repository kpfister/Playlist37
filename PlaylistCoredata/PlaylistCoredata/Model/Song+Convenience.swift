//
//  Song+Convenience.swift
//  PlaylistCoredata
//
//  Created by Cameron Stuart on 11/11/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation

extension Song {
    
    convenience init(songTitle: String, artistName: String, playlist: Playlist) {
        self.init(context: CoreDataStack.context)
        self.songTitle = songTitle
        self.artistName = artistName
        self.playlist = playlist
    }
}
