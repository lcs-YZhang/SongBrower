//
//  RemoteImageView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-21.
//

import SwiftUI

/// Attempts to synchronously load an image at the provided URL; do not use this view to load many image files within an app at the same time (e.g.: as part of a list), otherwise, there may be noticeable lag in the user interface.
struct RemoteImageView: View {
    
    // MARK: Stored properties
    
    // The address of the remote image to load
    var imageUrl: String
    
    // A UIImage instace that will display the actual image
    @State var image: UIImage = UIImage(systemName: "questionmark.diamond.fill")!
    
    // MARK: Computed properties
    var body: some View {
        
        // A standard Image view, initialized with the image property
        Image(uiImage: image)
            .onAppear {
                // 1. Create a URL instance from the image URL
                // 2. Load the raw data from this URL
                // 3. Attempt to create a UIImage instance from the raw data
                if let url = URL(string: imageUrl),
                   let rawData = try? Data(contentsOf: url),
                   let loadedImage = UIImage(data: rawData) {
                    
                    // Load the remote image
                    image = loadedImage
                    
                }
            }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Example of an image that should load successfully
        RemoteImageView(imageUrl: "https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/9c/91/83/9c918303-e0a4-2d4b-97d6-f986b9fba604/source/100x100bb.jpg")
        
        // Example of an image that will not load
        //        RemoteImageView(imageUrl: "https://this.is.a.broken.link")
    }
}
