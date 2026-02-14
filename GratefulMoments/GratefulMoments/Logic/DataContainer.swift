//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by Dhruv Nakum on 2/12/26.
//

import SwiftData
import SwiftUI


@Observable
@MainActor //Everything inside this class must run on the main thread
class DataContainer {
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        let schema = Schema([
            Moment.self
        ])
        
        let modelConfinguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)
        
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfinguration])
            
            if includeSampleMoments {
                loadSampleMoments()
            }
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func loadSampleMoments() {
        for moment in Moment.sampleData {
            context.insert(moment)
        }
    }
}

private let sampleContainer = DataContainer(includeSampleMoments: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
