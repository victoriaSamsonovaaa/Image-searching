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
    @State var showFind = true
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height - 830)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10)
                        .foregroundColor(.secondary)
                    TextField("Search", text: self.$search)
                        .font(.title3)
                    
                    if self.search != "" {
                        if self.showFind {
                            Text("Find")
                                .foregroundColor(.blue)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    withAnimation {
                                        self.flag = true
                                        self.showFind = false
                                    }
                                }
                        }
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .bold))
                            .padding(.trailing, 10)
                            .onTapGesture {
                                self.showFind = true
                                search = ""
                                self.showFind = true
                            }
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 40)
                .background(Color.gray.opacity(0.10))
                .cornerRadius(10)
                .onTapGesture {
                    self.flag = true
                }
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height - 830)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
//                        ForEach(model.results) { image in
//                            if let url = URL(string: image.urls.regular) {
//                                AsyncImage(url: url) { image in
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                }
//                                placeholder: {
//                                    ProgressView()
//                                }
//                            }
//                        }
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                        Text("aaaaaaaaaaaaaaaaaaaaa")
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
