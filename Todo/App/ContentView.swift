//
//  ContentView.swift
//  Todo
//
//  Created by Önder Koşar on 17.10.2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello, world!")
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddTodoView.toggle()
                }) {
                    Image(systemName: "plus")
                } // ADD BUTTON
                    .sheet(isPresented: $showingAddTodoView) {
                        AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                    }
            )
        } //: NAVIGATION VIEW
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
