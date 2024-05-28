//
//  ProfileViewModel.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var photos: [String] = ["men", "woman"]
    
    @Published var UPhoto = ""
    @Published var UName = ""
    @Published var UPlan = ""
    @Published var UWatching = ""
    @Published var UCompleted = ""

    @AppStorage("userPhoto") var userPhoto = ""
    @AppStorage("userName") var userName = ""
    @AppStorage("plan") var plan = ""
    @AppStorage("watching") var watching = ""
    @AppStorage("completed") var completed = ""


    @Published var isEditProfile: Bool = false
    @Published var isEditStatistics: Bool = false
}

