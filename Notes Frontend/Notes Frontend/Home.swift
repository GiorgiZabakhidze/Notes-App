//
//  ContentView.swift
//  Notes Frontend
//
//  Created by Giorgi Zabakhidze on 10/8/23.
//

import SwiftUI

struct Home: View {
    @State var notes = [Note]()
    
    var body: some View {
        NavigationView {
            List(self.notes) { note in
                Text(note.note)
                    .padding(10)
            }
            .onAppear(perform: {
                    fetchNotes()
                })
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                    print("Note has been Added")
                }, label: {
                    Text("Add")
                }))
        }
    }
    
    func fetchNotes() {
        let url = URL(string: "http://localhost:3000/notes")!
        
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data else { return }
            
            do {
                let notes = try JSONDecoder().decode([Note].self, from: data)
                self.notes = notes
            }catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct Note: Identifiable, Codable {
    var id: String { _id }
    var _id: String
    var note: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
