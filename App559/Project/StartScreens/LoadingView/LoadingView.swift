//
//  LoadingView.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    LoadingView()
}
