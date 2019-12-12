//
//  NoteView.swift
//  hD SwiftUI Notes
//
//  Created by Thomas Sillmann on 12.12.19.
//  Copyright © 2019 Thomas Sillmann. All rights reserved.
//

import SwiftUI

struct NoteView: View {
    @ObservedObject var note: Note
    
    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
            TextView(text: $note.content)
                .border(Color.gray, width: 1)
        }
        .navigationBarItems(trailing: FavoriteButton(isFavorite: $note.isFavorite))
        .navigationBarTitle(note.title)
        .padding()
    }
}

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button(action: {
            self.isFavorite.toggle()
        }) {
            Image(systemName: self.isFavorite ? "star.fill" : "star")
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(note: Note(title: "Lorem ipsum", content: "Lorem ipsum ..."))
    }
}
