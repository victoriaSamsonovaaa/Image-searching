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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height - 830)
                HStack(spacing: 10) {
                    TextField("Enter a query to find an image", text: self.$search)
                        .padding(20)
                        .font(.title3)
                        .frame(width: UIScreen.main.bounds.size.width - 90, height: 50)
                        .background(Color.gray.opacity(0.10))
                        .cornerRadius(10)
                    Button(action: {
                        //searchig function
                        model.results = []
                        model.searchImages(queryWord: search)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .imageScale(.large)
                            .frame(width: UIScreen.main.bounds.size.width - 340, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .foregroundStyle(.tint)
                Spacer()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(model.results) { image in
                            if let url = URL(string: image.urls.regular) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
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
