//
//  ItemDetailView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-21.
//

import SwiftUI

struct ItemDetailView: View {
    
    // MARK: Stored properties
    var imageUrl: String
    var title: String
    var caption: String
    
    // MARK: Computed properties
    var body: some View {

        HStack {
            
            RemoteImageView(imageUrl: imageUrl)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                
                Text(title)
                    .font(.title)
                
                Text(caption)
                    .font(.subheadline)
                
            }
            
        }

    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(imageUrl: "https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/9c/91/83/9c918303-e0a4-2d4b-97d6-f986b9fba604/source/100x100bb.jpg",
                       title: "Shake It Off",
                       caption: "Taylor Swift")
    }
}
