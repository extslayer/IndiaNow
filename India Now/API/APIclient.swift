//
//  APIclient.swift
//  India Now
//
//  Created by Manmohan Shrivastava on 06/10/24.
//
//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=522a65382ba244938d417601a702f473
import Foundation

// SpaceData struct to represent each article
struct NewsData: Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var url: String
    var image: String?
    var source: String?
    
    // Exclude 'id' from the keys used for encoding/decoding
    private enum CodingKeys: String, CodingKey {
        case title, url, image, source, description
    }
    
    func sanitizeText(_ text: String) -> String {
            let pattern = "[^a-zA-Z0-9\\s]" // Removes any characters that are not letters, numbers, or spaces
            let regex = try? NSRegularExpression(pattern: pattern)
            let range = NSRange(location: 0, length: text.utf16.count)
            let cleanText = regex?.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "") ?? text
            return cleanText.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        // Sanitized title and description properties
        var sanitizedTitle: String {
            sanitizeText(title)
        }
        
        var sanitizedDescription: String {
            sanitizeText(description)
        }
}

// Wrapper struct for the API response
struct NewsAPIResponse: Codable {
    var data: [NewsData]
}

@MainActor
class NewsAPI: ObservableObject {
    @Published var news: [NewsData] = []
    
    func getData() {
        guard let url = URL(string: "https://api.mediastack.com/v1/news?access_key=7975ecaa6853c37c2fe2a5219458073a&countries=in&languages=en") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response Status Code: \(httpResponse.statusCode)")
            }
            
            // Check if there's data, otherwise return an error object
            guard let data = data else {
                let tempError = error?.localizedDescription ?? "Unknown error"
                DispatchQueue.main.async {
                    let emptyResponse = NewsAPIResponse(data: [NewsData(title: tempError, description: "Try swiping down to refresh as soon as you have internet again.", url: "Error", image: "error", source: "Error")])
                            self.news = emptyResponse.data // Assign the results array to 'news'
                }
                return
            }
            
            // Print the raw data to check the response
            if let rawString = String(data: data, encoding: .utf8) {
                print("Response Data:"+rawString)
            }

            do {
                // Decode the top-level response object
                let spaceAPIResponse = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    print("Loaded new data successfully! Articles: \(spaceAPIResponse.data.count)")
                    self.news = spaceAPIResponse.data
                }
            } catch {
                print("Decoding error: \(error)")
                DispatchQueue.main.async {
                    self.news = [NewsData(title: "Error loading the data", description: "Try swiping down to refresh as soon as you have internet again.", url: "Error", image: "error", source: "Error")]
                }
            }
        }.resume()
    }
}
