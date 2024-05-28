//
//  LibraryViewModel.swift
//  App559
//
//  Created by IGOR on 15/05/2024.
//

import SwiftUI
import CoreData

final class LibraryViewModel: ObservableObject {
    
    @Published var types: [String] = ["All", "Watching", "Plan to watch", "Completed"]
    @Published var selType = "All"
    
    @Published var PhotoFOrFilm: [String] = ["Dexter", "House", "Euphoria"]
    @Published var selectedPhoto = ""
    
    @Published var typesForAdd: [String] = ["Watching", "Plan to watch", "Completed"]
    @Published var selTypeForAdd = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    
    @AppStorage("userPhoto") var userPhoto = ""
    @AppStorage("userName") var userName = ""
    
    @Published var filPhoto = ""
    @Published var filType = ""
    @Published var filTitle = ""
    @Published var filComment = ""
    @Published var filEpisodes = ""
    @Published var filCompletedE = ""
    @Published var filRate = ""
    
    @Published var films: [FilmsModel] = []
    @Published var selectedFilm: FilmsModel?
    
    func fetchFilmsAll() -> [FilmsModel] {
        
        return films.filter{($0.filType ?? "") == selType}
    }
    
    func addFilm() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FilmsModel", into: context) as! FilmsModel
        
        loan.filPhoto = filPhoto
        loan.filType = filType
        loan.filTitle = filTitle
        loan.filComment = filComment
        loan.filEpisodes = filEpisodes
        loan.filCompletedE = filCompletedE
        loan.filRate = filRate
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchFilms() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FilmsModel>(entityName: "FilmsModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.films = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.films = []
        }
    }
}

