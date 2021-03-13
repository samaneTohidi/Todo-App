//
//  AddTodoView.swift
//  Todo App
//
//  Created by Samano on 3/13/21.
//

import SwiftUI

struct AddTodoView: View {
    
    // MARK: _ PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    
    let priorities = ["High", "Normal", "Low"]

    
    // MARK - BODY

    var body: some View {
        NavigationView{
                
            VStack{
                
            Form{
              
                // MARK: - TODO NAME
                TextField("Todo", text: $name)
                
                // MARK: - TODO PRIORITY
                
                Picker("Priority", selection: $priority)
                    {
                    
                    ForEach(priorities, id: \.self){
                        
                       Text($0)
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle())
                
                // MARK: - SAVE BUTTON
                Button(action: {
                    print("Save a new todo item.")
                }) {
                    
                    Text("Save")
                } //: SAVE BUTTON
            } //: FROM

          Spacer()
                
            } // : VSTACK
       
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
              Button(action: {
                self.presentationMode.wrappedValue.dismiss()
              }) {
                Image(systemName: "xmark")
              }
          )
            
    } //: NAVIGATION
        
    }
    
}

// MARK: - PREIVIEW

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
            .previewDevice("iPhone 11 Pro")
    }
}
