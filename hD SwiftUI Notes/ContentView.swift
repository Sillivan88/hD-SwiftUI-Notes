//
//  ContentView.swift
//  hD SwiftUI Notes
//
//  Created by Thomas Sillmann on 12.12.19.
//  Copyright © 2019 Thomas Sillmann. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var notesManager = NotesManager.shared
    
    @State private var showsCreateNoteSheet = false
    
    var body: some View {
        NavigationView {
            List(notesManager.notes) { note in
                NavigationLink(destination: NoteView(note: note)) {
                    NoteCell(note: note)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.showsCreateNoteSheet = true
            }) {
                Image(systemName: "plus.circle")
            })
            .navigationBarTitle("Notes")
        }
        .sheet(isPresented: $showsCreateNoteSheet) {
            CreateNoteNavigationView(isPresented: self.$showsCreateNoteSheet)
        }
    }
}

struct NoteCell: View {
    @ObservedObject var note: Note
    
    var body: some View {
        HStack {
            Text(note.title)
            if note.isFavorite {
                Spacer()
                Image(systemName: "star.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            NoteCell(note: Note(title: "Note", content: "Content", isFavorite: true))
                .previewLayout(.sizeThatFits)
        }
    }
}
