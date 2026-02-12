//
//  MomentsView.swift
//  GratefulMoments
//
//  Created by Dhruv Nakum on 2/12/26.
//

import SwiftUI
import SwiftData

struct MomentsView: View {
    @State private var showCreateMoment = false
    
    @Query(sort: \Moment.timeStamp)
    private var moment: [Moment]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                pathItems.frame(maxWidth: .infinity)
            }
            .overlay {
                if moment.isEmpty {
                    ContentUnavailableView {
                        Label("No moments yet!", systemImage: "exclamationmark.circle.fill")
                    } description: {
                        Text("Post a note or pgoto to start filling this space with gratitude")
                    }
                }
            }
            .navigationTitle("Grateful Moments")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                            showCreateMoment = true
                    } label: {
                         Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }
                }
            }
        }
    }
    
    private var pathItems: some View {
        ForEach(moment) { moment in
            Text(moment.title)
        }
    }
}

#Preview {
    MomentsView()
}

#Preview("No moments") {
    MomentsView()
        .modelContainer(for: [Moment.self])
}
