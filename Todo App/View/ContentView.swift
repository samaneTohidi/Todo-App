//
//  ContentView.swift
//  Todo App
//
//  Created by Samano on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTISE
    @State private var showingAddTodoView: Bool = false

    // MARK: - BODY
    
    
    var body: some View {
        
        NavigationView{
            List(0 ..< 5) { item in
                Text("Hello, world!")
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }){
                                        Image(systemName: "plus")
                                    }
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView()
                }
            
            )
        } //: NAVIGATION
           
    }
}



// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
