//
//  ContentView.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SearchingView()
    }
}

struct SearchingView: View {
    @State var search = ""
    
    var body: some View {
        NavigationView {
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
                    List {
                        
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
