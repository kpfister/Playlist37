//
//  PlaylistController.swift
//  PlaylistCoredata
//
//  Created by Cameron Stuart on 11/11/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    // Shared Instance
    static let shared = PlaylistController()
    
    // Source of Truth
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    //CRUD
    // create
    func createPlaylist(name: String) {
        _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    // delete
    func deletePlaylist(playlist: Playlist) {
        playlist.managedObjectContext?.delete(playlist)
        saveToPersistentStore()
    }
    
    // Persistence
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
