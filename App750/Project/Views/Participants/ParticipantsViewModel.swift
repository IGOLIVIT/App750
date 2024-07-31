//
//  ParticipantsViewModel.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI
import CoreData

final class ParticipantsViewModel: ObservableObject {
    
    @Published var mens: [String] = ["m1", "m2"]
    @Published var currMen = ""
    
    @Published var tracks: [String] = ["tras1"]
    @Published var currTrack = ""
    
    @Published var teamsPhoto: [String] = ["MERCEDES-AMG PETRONAS", "RED BULL RACING HONDA", "SCUDERIA FERRARI MISSION WINNOW"]
    @Published var curTPhoto: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var parPhoto: String = ""
    @Published var parName: String = ""
    @Published var parTeam: String = ""
    @Published var parDate: String = ""
    @Published var parAge: String = ""
    @Published var parNumber: String = ""
    
    @Published var participants: [PartModel] = []
    @Published var selectedParticipant: PartModel?
    
    func addParticipant() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PartModel", into: context) as! PartModel

        loan.parPhoto = parPhoto
        loan.parName = parName
        loan.parTeam = parTeam
        loan.parDate = parDate
        loan.parAge = parAge
        loan.parNumber = parNumber

        CoreDataStack.shared.saveContext()
    }

    func fetchParticipants() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PartModel>(entityName: "PartModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.participants = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.participants = []
        }
    }
}
