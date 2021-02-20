//
//  ContentView.swift
//  SongBrower
//
//  Created by Steven Zhang on 2021-02-20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored properties
    
    //keep track of what what the user search for
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            
            SearchBarView(text: $searchText)
            
            //Show a prompt when no search text given
            if searchText.isEmpty {
                
                Spacer()
                
                Text("Please enter an artist name")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Spacer()
                
            } else {
            
                //Push the search bar to the top
                Spacer()
         }
      }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
