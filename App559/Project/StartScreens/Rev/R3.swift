//
//  R3.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Image("stars")
                    
                    HStack {
                        
                        Text("Rate")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("added")
                            .foregroundColor(Color.white)
                            .font(.system(size: 32, weight: .bold))
                        
                    }
                    
                    Text("films and series")
                        .foregroundColor(Color.white)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    R3()
}
