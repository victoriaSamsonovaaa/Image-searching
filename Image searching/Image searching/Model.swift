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

    func searchImages(queryWord: String) {
        //extra
        DispatchQueue.main.async {
          //  self.objectWillChange.send()
            self.results.removeAll()
            self.noImages = false
        }
        let key = "ETqLuPEozPV2JsqU5y5tUfwnLd5qJBBlQEu_EsfHWrw"
        let urlQuery = "https://api.unsplash.com/search/photos?page=1&per_page=20&query=\(queryWord)&client_id=\(key)"
        guard let url = URL(string: urlQuery) else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            print("got data")
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    if jsonResult.results.count == 0 {
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
