//
//  SearchBarView.swift
//  SwiftUI-Chicago-HSE-LCS
//
//  Created by Russell Gordon on 2021-02-14.
//  Copyright © 2021 Gordon, Russell. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
    
    var placeholderText: String = "Search..."
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    // Whether to animate changes to the search field appearance
    @State private var animateSearchField = false
    
    // Initialize a timer that will fire in one second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            
            TextField(placeholderText, text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing && !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    isEditing = true
                }
                // Make the search field animate as it changes shape
                // (Except when it first appears in the view)
                .animation(animateSearchField ? .default : .none)
            
            if isEditing {
                Button(action: {
                    
                    // Stop editing and clear search text
                    isEditing = false
                    text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .padding(.bottom, -2)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .onReceive(timer) { input in
            
            // Set the flag to apply animation to the search field
            animateSearchField = true
            
            // Stop the timer
            timer.upstream.connect().cancel()
            
        }

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
