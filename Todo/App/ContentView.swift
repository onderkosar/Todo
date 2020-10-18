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
    
    @FetchRequest(entity: TodoObj.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TodoObj.name, ascending: true)]) var todos: FetchedResults<TodoObj>
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos, id: \.self) { todo in
                    HStack {
                        Text(todo.name ?? "Unknown")
                        Spacer()
                        Text(todo.priority ?? "Unknown")
                    }
                } //: FOREACH
                .onDelete(perform: deleteTodo)
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
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
    
    // MARK: - FUNCTIONS
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView()
            .environment(\.managedObjectContext, context)
    }
}
