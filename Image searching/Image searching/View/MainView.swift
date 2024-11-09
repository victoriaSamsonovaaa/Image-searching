//
//  ContentView.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import SwiftUI

struct MainView: View {
    @State private var search = ""
    @State private var showAttentionalText = false
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
            }
        }
       // SearchingView()
    }
}

#Preview {
    MainView()
}
