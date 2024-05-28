//
//  ProfileView.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        VStack(spacing: 12) {
                            
                            if viewModel.userPhoto.isEmpty {
                                
                                Image(systemName: "camera")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 26, weight: .regular))
                                    .padding(20)
                                    .background(Circle().fill(.white.opacity(0.1)))
                                    .padding(.top, 30)
                                
                            } else {
                                
                                Image(viewModel.userPhoto)
                                    .padding(.top, 30)
                            }
                            
                            if viewModel.userName.isEmpty {
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isEditProfile = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text("Username")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Image(systemName: "pencil")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    .padding(.bottom)
                                })
                                
                            } else {
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isEditProfile = true
                                    }
                                    
                                }, label: {
                                    
                                    
                                    HStack {
                                        
                                        Text(viewModel.userName)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))                      
                                        
                                        Image(systemName: "pencil")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                })
                                .padding(.bottom)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Plan to watch")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            if viewModel.plan.isEmpty {
                                
                                Text("0")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                                
                            } else {
                                
                                Text(viewModel.plan)
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Watching")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            if viewModel.watching.isEmpty {
                                
                                Text("0")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                                
                            } else {
                                
                                Text(viewModel.watching)
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Completed")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            if viewModel.completed.isEmpty {
                                
                                Text("0")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                                
                            } else {
                                
                                Text(viewModel.completed)
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $viewModel.isEditProfile, content: {
            
            EditingProfile(viewModel: viewModel)
        })
    }
}

#Preview {
    ProfileView()
}
