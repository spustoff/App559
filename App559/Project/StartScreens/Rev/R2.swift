//
//  R2.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        Text("Keep track")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("of how")
                            .foregroundColor(Color.white)
                            .font(.system(size: 32, weight: .bold))
                        
                    }
                    
                    Text("many episodes you've watched")
                        .foregroundColor(Color.white)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R3()
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
    R2()
}
