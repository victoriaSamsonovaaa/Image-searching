//
//  Model.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import SwiftUI

class Model: ObservableObject {
    
    @Published var results: [Result] = []
    
    func searchImages(queryWord: String) {
        let key = "ETqLuPEozPV2JsqU5y5tUfwnLd5qJBBlQEu_EsfHWrw"
        let urlQuery = "https://api.unsplash.com/search/photos?page=1&per_page=20&query=\(queryWord)&client_id=\(key)"
        guard let url = URL(string: urlQuery) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

