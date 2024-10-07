//
//  NewsArticle.swift
//  India Now
//
//  Created by Manmohan Shrivastava on 06/10/24.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title: String
    let imageurl: String
    let source: String
    let description: String
    var body: some View {
        VStack(alignment: .leading){
            
            Text(source)
                .font(.headline)
                .padding(.horizontal)
                .padding(.top)
                .foregroundColor(.gray)
            
            
            HStack{
                CachedAsyncImage(url: URL(string:imageurl),
                                 transaction: Transaction(animation: .easeInOut)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    } else{
                        HStack{
                            /*Image("img")
                                .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)*/
                        }
                        
                    }
                    
                }
            }
            
            
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(8)
            
            
            Text(description)
                .font(.body)
                .padding(8)
            
            
            
        }
    }
}

#Preview {
    NewsArticle(title: "Manmohan", imageurl: "https://i.im.ge/2024/10/07/k0Naef.INDIA-nOW.png", source: "Manmohan", description: "Manmohan")
}
