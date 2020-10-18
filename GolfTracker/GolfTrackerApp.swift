//
//  GolfTrackerApp.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import SwiftUI

@main
struct GolfTrackerApp: App {
    var body: some Scene {
        WindowGroup {
//            let viewModel = StatsView.ViewModel()
//            StatsView(viewModel: viewModel)

            let viewModel = CourseSearch.ViewModel()
            CourseSearch(viewModel: viewModel)
        }
    }
}
