//
//  NewsView.swift
//  India Now
//
//  Created by Manmohan Shrivastava on 06/10/24.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var data : NewsAPI
    @Environment(\.openURL) var openURL
    private var textwidth = 300.0
    
    var body: some View {
        List{
            ForEach(data.news){ news in
                NewsArticle(title: news.sanitizedTitle, imageurl: news.image ?? "https://i.im.ge/2024/10/07/k0Naef.INDIA-nOW.png", source: news.source ?? "None", description: news.sanitizedDescription)
                    .onTapGesture {
                        openURL(URL(string: news.url)!)
                    }
                
            }
        }
        .refreshable {
            data.getData()
        }
    }
}

#Preview {
    NewsView()
        .environmentObject(NewsAPI())
}

