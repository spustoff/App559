//
//  AddFilm.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct AddFilm: View {
    
    @StateObject var viewModel: LibraryViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.gray.opacity(0.7))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color.gray.opacity(0.7))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.filPhoto = viewModel.selectedPhoto
                            viewModel.filType = viewModel.selTypeForAdd
                            
                            viewModel.addFilm()
                            
                            viewModel.selectedPhoto = ""
                            viewModel.selTypeForAdd = ""
                            viewModel.filTitle = ""
                            viewModel.filComment = ""
                            viewModel.filEpisodes = ""
                            viewModel.filCompletedE = ""
                            viewModel.filRate = ""
                            
                            viewModel.fetchFilms()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        .opacity(viewModel.selTypeForAdd.isEmpty || viewModel.filTitle.isEmpty || viewModel.filComment.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.selTypeForAdd.isEmpty || viewModel.filTitle.isEmpty || viewModel.filComment.isEmpty ? true : false)
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.PhotoFOrFilm, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.selectedPhoto.isEmpty {
                                
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 26))
                                    .frame(width: 140, height: 210)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                
                            } else {
                                
                                Image(viewModel.selectedPhoto)
                                    .resizable()
                                    .frame(width: 140, height: 210)
                            }
                            
                        })
                        
                        Text("Status")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                                                                                    
                                HStack {
                                
                                ForEach(viewModel.typesForAdd, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.selTypeForAdd = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                                .foregroundColor(viewModel.selTypeForAdd == index ? .black : .gray)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.selTypeForAdd == index ? Color("prim") : .white.opacity(0.1)))
                                        })

                                    }
                                }
                            .frame(height: 60)
                            .padding(.bottom)
                        
                        Text("Description")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Add title")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.filTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.filTitle)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Add comment")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.filComment.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.filComment)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Total episodes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0")
                                        .foregroundColor(.white.opacity(0.3))
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.filEpisodes.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.filEpisodes)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                
                            }
                            
                            VStack {
                                
                                Text("Episodes watched")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0")
                                        .foregroundColor(.white.opacity(0.3))
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.filCompletedE.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.filCompletedE)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                
                            }
                        }
                        .padding(.top)
                        
                        HStack {
                            
                            Text("Rate the series")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("1-5")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.filRate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.filRate)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddFilm(viewModel: LibraryViewModel())
}
