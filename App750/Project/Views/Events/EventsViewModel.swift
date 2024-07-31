//
//  EventsViewModel.swift
//  App750
//
//  Created by IGOR on 31/07/2024.
//

import SwiftUI
import CoreData

final class EventsViewModel: ObservableObject {
    
    @AppStorage("entries") var entries: Int = 0
    
    @Published var mens: [String] = ["t1", "t2", "t3", "t4"]
    @Published var currMen = ""
    
    @Published var tracks: [String] = ["tras1"]
    @Published var currTrack = ""
    
    @Published var teamsPhoto: [String] = ["MERCEDES-AMG PETRONAS", "RED BULL RACING HONDA", "SCUDERIA FERRARI MISSION WINNOW"]
    @Published var curTPhoto: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var evPhoto: String = ""
    @Published var evLoc: String = ""
    @Published var evDate: String = ""
    @Published var evTeam: String = ""
    
    @Published var events: [EventModel] = []
    @Published var selectedEvent: EventModel?
    
    func addEvent() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EventModel", into: context) as! EventModel

        loan.evPhoto = evPhoto
        loan.evLoc = evLoc
        loan.evDate = evDate
        loan.evTeam = evTeam

        CoreDataStack.shared.saveContext()
    }

    func fetchEvents() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventModel>(entityName: "EventModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.events = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.events = []
        }
    }
}
