//
//  SearchingView.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import SwiftUI


struct SearchingView: View {
    @State var search = ""
    @StateObject private var model = Model()
    @State var showAttentionalText = false
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]
    
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
                            .onChange(of: search) {
                                self.showAttentionalText = false
                            }
                        if self.search != "" {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .bold))
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    search = ""
                                    self.model.results.removeAll()
                                    self.model.noImages = false
                                }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 80, height: 40)
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(10)
                    
                    Button("Find") {
                        if search == "" {
                            self.showAttentionalText = true
                        }
                        else {
                            self.model.searchImages(queryWord: search)
                            
                        }
                    }
                }
                Spacer()
                    .frame(height: 20)

                if self.model.noImages {
                    Text("""
                            Nothing was founded.
                            Try one more time
                        """)
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding(.top, UIScreen.main.bounds.size.height - 840)
                        .multilineTextAlignment(.center)
                }
                
                if self.showAttentionalText {
                    Text("You should input a query")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding(.top, UIScreen.main.bounds.size.height - 840)
                        .multilineTextAlignment(.center)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(model.results) { result in
                            if let url = URL(string: result.urls.regular) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(10)
                                }
                                placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    .padding(10)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

