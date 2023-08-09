//
//  ContentView.swift
//  Notes
//
//  Created by Macbook Pro on 9/8/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            List(0..<9) { i in
                Text("We Are Now At \(i)")
                    .padding()
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing:
                Button(action: {
                    print("Add a Note")
                }, label: {
                    Text("Add")
                })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
