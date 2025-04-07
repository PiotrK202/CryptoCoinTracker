//
//  ErrorView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 4/4/25.
//

import SwiftUI

struct ImageDownloadErrorView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.square.fill")
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    ImageDownloadErrorView()
}
