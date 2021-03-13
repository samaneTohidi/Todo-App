//
//  ContentView.swift
//  Todo App
//
//  Created by Samano on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTISE
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAddTodoView: Bool = false
    @FetchRequest(entity: Todo_App.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo_App.name, ascending: true)]) var todos: FetchedResults<Todo_App>
    

    // MARK: - BODY
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(self.todos, id: \.self){
                    todo in
                    HStack{
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Unkown")
                    }
                }
                
                .onDelete(perform: deleteTodo)

            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }){
                                        Image(systemName: "plus")
                                    }
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                }
            
            )
        } //: NAVIGATION
           
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
          .previewDevice("iPhone 11 Pro")
    }
}
