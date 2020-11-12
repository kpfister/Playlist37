//
//  Playlist+Convenience.swift
//  PlaylistCoredata
//
//  Created by Cameron Stuart on 11/11/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation

extension Playlist {
    
    convenience init(name: String) {
        self.init(context: CoreDataStack.context)
        self.name = name
    }
}
