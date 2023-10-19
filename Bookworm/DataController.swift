//
//  DataController.swift
//  Bookworm
//
//  Created by HubertMac on 15/10/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let containter = NSPersistentContainer(name: "BookWorm")
    
    init() {
        containter.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
