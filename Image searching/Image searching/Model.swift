//
//  Model.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import SwiftUI

class Model: ObservableObject {
    
    @Published var results: [Result] = []
    @Published var noImages = false
    private let apiKey: String
    
    init() {
        // Получаем API ключ из Info.plist
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKey") as? String {
            self.apiKey = apiKey
            print("got")
        } else {
            fatalError("APIKey not found in Info.plist")
        }
    }

    func searchImages(queryWord: String) {
        //extra
        DispatchQueue.main.async {
            self.results.removeAll()
            self.noImages = false
        }
        
        let urlQuery = "https://api.unsplash.com/search/photos?page=1&per_page=20&query=\(queryWord)&client_id=\(apiKey)"
        guard let url = URL(string: urlQuery) else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    if jsonResult.results.isEmpty {
                        self?.noImages = true
                    }
                    else {
                        self?.results = jsonResult.results
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}

