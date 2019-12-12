//
//  NotesManager.swift
//  hD SwiftUI Notes
//
//  Created by Thomas Sillmann on 12.12.19.
//  Copyright © 2019 Thomas Sillmann. All rights reserved.
//

import Foundation

class NotesManager {
    static let shared = NotesManager()
    var notes = [Note]()
}
