//
//  LibraryView.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct LibraryView: View {
    
    @StateObject var viewModel = LibraryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    if viewModel.userPhoto.isEmpty {
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 16, weight: .semibold))
                            .padding(20)
                            .background(Circle().fill(.white.opacity(0.1)))
                        
                    } else {
                        
                        Image(viewModel.userPhoto)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                    }
                    
                    VStack {
                        
                        if viewModel.userName.isEmpty {
                            
                            Text("Username")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        } else {
                            
                            Text(viewModel.userName)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        
                        Text("Welcome!")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
                
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            
                            ForEach(viewModel.types, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.selType == index ? .black : .white.opacity(0.6))
                                        .font(.system(size: 15, weight: .medium))
                                        .padding(8)
                                        .padding(.horizontal, 7)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim").opacity(viewModel.selType == index ? 1 : 0)))
                                        .background(RoundedRectangle(cornerRadius: 6).stroke(Color.white.opacity(0.6).opacity(viewModel.selType == index ? 0 : 1)))
                                    
                                        .padding(1)
                                })
                            }
                        }
                        .padding()
                    }
                    .frame(height: 50)
                    
                    if viewModel.films.isEmpty {
                        
                        VStack {
                            
                            Image("empty")
                            
                            Text("Add a series or movie you are going to watch")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .padding()
                                .padding(.horizontal, 60)
                                .multilineTextAlignment(.center)
                            
                            Text("Click plus to add")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding()
                        
                        Spacer()
                        
                    } else {
                        
                        if viewModel.selType == "All" {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack(spacing: 10) {
                                    
                                    ForEach(viewModel.films, id: \.self) { index in
                                        
                                        HStack {
                                            
                                            Image(index.filPhoto ?? "")
                                                .resizable()
                                                .frame(width: 110, height: 170)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                            
                                            VStack(alignment: .leading, spacing: 12) {
                                                
                                                Text(index.filTitle ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .medium))
                                                
                                                Text(index.filComment ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                    .padding(.bottom)
                                                
                                                GeometryReader { reader in
                                                    
                                                    let result = CGFloat((CGFloat(Int(index.filCompletedE ?? "") ?? 0) * reader.size.width)) / CGFloat(Int(index.filEpisodes ?? "") ?? 1)
                                                    
                                                    ZStack(alignment: .leading, content: {
                                                        
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(.gray.opacity(0.2))
                                                            .frame(width: reader.size.width, height: 2)
                                                        
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color("prim"))
                                                            .frame(width: result, height: 2)
                                                    })
                                                }
                                                .frame(height: 10)
                                                
                                                HStack {
                                                    
                                                    Image("star")
                                                        .renderingMode(.template)
                                                        .foregroundColor(.white.opacity(0.8))
                                                    
                                                    Text(index.filRate ?? "")
                                                        .foregroundColor(.white.opacity(0.8))
                                                        .font(.system(size: 14, weight: .regular))
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(index.filCompletedE ?? "")/\(index.filEpisodes ?? "")ep")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 14, weight: .regular))
                                                }
                                                .padding(.top)
                                            }
                                        }
                                        .frame(height: 170)
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.1))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack(spacing: 10) {
                                    
                                    ForEach(viewModel.fetchFilmsAll(), id: \.self) { index in
                                        
                                        HStack {
                                            
                                            Image(index.filPhoto ?? "")
                                                .resizable()
                                                .frame(width: 110, height: 170)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                            
                                            VStack(alignment: .leading, spacing: 12) {
                                                
                                                Text(index.filTitle ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .medium))
                                                
                                                Text(index.filComment ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                    .padding(.bottom)
                                                
                                                GeometryReader { reader in
                                                    
                                                    let result = CGFloat((CGFloat(Int(index.filCompletedE ?? "") ?? 0) * reader.size.width)) / CGFloat(Int(index.filEpisodes ?? "") ?? 1)
                                                    
                                                    ZStack(alignment: .leading, content: {
                                                        
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(.gray.opacity(0.2))
                                                            .frame(width: reader.size.width, height: 2)
                                                        
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color("prim"))
                                                            .frame(width: result, height: 2)
                                                    })
                                                }
                                                .frame(height: 10)
                                                
                                                HStack {
                                                    
                                                    Image("star")
                                                        .renderingMode(.template)
                                                        .foregroundColor(.white.opacity(0.8))
                                                    
                                                    Text(index.filRate ?? "")
                                                        .foregroundColor(.white.opacity(0.8))
                                                        .font(.system(size: 14, weight: .regular))
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(index.filCompletedE ?? "")/\(index.filEpisodes ?? "")ep")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 14, weight: .regular))
                                                }
                                                .padding(.top)
                                            }
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.1))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
            }
            
            VStack {
                
                Spacer()

                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(16)
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }
        .onAppear{
            
            viewModel.fetchFilms()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddFilm(viewModel: viewModel)
        })
    }
}

#Preview {
    LibraryView()
}
