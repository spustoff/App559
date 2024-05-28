//
//  EditingProfile.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct EditingProfile: View {
    
    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit")
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
                            
                            viewModel.userName = viewModel.UName
                            
                            viewModel.plan = viewModel.UPlan
                            viewModel.watching = viewModel.UWatching
                            viewModel.completed = viewModel.UCompleted
                            
                            viewModel.UPlan = ""
                            viewModel.UWatching = ""
                            viewModel.UCompleted = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditProfile = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.UPhoto = index
                                viewModel.userPhoto = viewModel.UPhoto
                                
                            }, label: {
                                
                                Image(index)
                            })
                            
                        }
                        
                    }, label: {
                        
                        if viewModel.userPhoto.isEmpty {
                            
                            Image("cam")
                                .padding(25)
                                .background(Circle().fill(.black))
                            
                        } else {
                            
                            Image(viewModel.userPhoto)
                        }
                        
                    })
                    .padding(.top, 30)
                    
                    ZStack(content: {
                        
                        if viewModel.userName.isEmpty {
                            
                            HStack {
                                
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .opacity(viewModel.UName.isEmpty ? 1 : 0)
                             
                                Image(systemName: "pencil")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                                    .opacity(viewModel.UName.isEmpty ? 1 : 0)

                            }
                            
                        } else {
                            
                            Text(viewModel.userName)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                                .opacity(viewModel.UName.isEmpty ? 1 : 0)
                        }
                        
                        TextField("", text: $viewModel.UName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 100)
                        
                    })
                    .padding()
                    
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    VStack(spacing: 10) {
                        
                        Text("Plan to watch")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UPlan.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UPlan)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Watching")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UWatching.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UWatching)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Completed")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.UCompleted.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.UCompleted)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        .padding(.bottom)

                    }
                    .padding(.top)
                }
            }
            .padding()
        }
    }
}


#Preview {
    EditingProfile(viewModel: ProfileViewModel())
}
