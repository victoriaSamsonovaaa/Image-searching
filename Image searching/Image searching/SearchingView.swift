//
//  SearchingView.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import SwiftUI


struct SearchingView: View {
    @State var search = ""
    @State private var model = Model()
    @State var flag = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height - 830)
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 10)
                            .foregroundColor(.secondary)
                        TextField("Search", text: self.$search)
                            .font(.title3)
                        if self.search != "" {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .bold))
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    search = ""
                                   // self.model.results.removeAll()
                                }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 80, height: 40)
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(10)
                    
                    Button("Find") {
                        self.model.results.removeAll()
                        model.searchImages(queryWord: search)
                        self.flag = true
                    }
                    
                }
                Spacer()
                    .frame(height: 20)
//
//                if self.search == "" {
//                    Text("Enter a query to find some pictures..")
//                        .padding(.top, UIScreen.main.bounds.size.height - 750)
//                        .foregroundColor(.secondary)
//                        .font(.title2)
//                }
//
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                        ForEach(model.results) { result in
                            if let url = URL(string: result.urls.regular) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.size.width - 30 , height: 200)
                                        .clipped()
                                        .cornerRadius(20)
                                }
                                placeholder: {
                                    ProgressView()
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

