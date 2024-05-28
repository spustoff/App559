//
//  R1.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        Text("Create")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("your own")
                            .foregroundColor(Color.white)
                            .font(.system(size: 32, weight: .bold))
                        
                    }
                    
                    Text("personal selection of films and series")
                        .foregroundColor(Color.white)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
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
    }
}

#Preview {
    R1()
}
