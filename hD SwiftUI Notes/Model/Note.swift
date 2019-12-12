//
//  Note.swift
//  hD SwiftUI Notes
//
//  Created by Thomas Sillmann on 12.12.19.
//  Copyright © 2019 Thomas Sillmann. All rights reserved.
//

import Foundation

class Note: Identifiable, ObservableObject {
    var id = UUID()
    @Published var title: String
    @Published var content: String
    @Published var isFavorite: Bool
    
    init(title: String = "", content: String = "", isFavorite: Bool = false) {
        self.title = title
        self.content = content
        self.isFavorite = isFavorite
    }
}
