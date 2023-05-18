//
//  DownloadView.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 08.05.2023.
//

import SwiftUI

struct DownloadProgressView: View {
    
    @Binding
    var progress: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 180, height: 60)
                .foregroundColor(.resource(.DarkGray))
            
            VStack(spacing: 10) {
                Text("Downloading...")
                    .font(.system(size: 16))
                    .foregroundColor(.resource(.White))
                
                buildDownloadIndicatorView()
            }
        }
    }
    
    @ViewBuilder
    private func buildDownloadIndicatorView() -> some View {
        ZStack(alignment: .leading) {
            let width: CGFloat = 150
            let height: CGFloat = 5
            let cornerRadius: CGFloat = 10
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: width, height: height)
                .foregroundColor(.resource(.Carbon))
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: width * progress, height: height)
                .foregroundColor(.resource(.White))
        }
    }
    
}

struct ArtifactDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadProgressView(progress: .constant(0.4))
    }
}
