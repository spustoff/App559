//
//  Reviews.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("Reviewsa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Rate our app in the")
                        .foregroundColor(Color.white)
                        .font(.system(size: 32, weight: .bold))
                    
                    HStack {
                        
                        Text("AppStore")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 32, weight: .bold))
                        
                    }
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                })
                .padding()
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
