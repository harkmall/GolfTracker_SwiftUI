//
//  CourseSearch.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import SwiftUI

struct CourseSearch: View {

    @ObservedObject private(set) var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            TextField("Search for Golf Course", text: $viewModel.query)
                .padding()
            List(viewModel.golfCourses) { golfCourse in
                CourseCell(course: golfCourse)
            }
        }
        .navigationBarTitle("Search")
    }
}

struct CourseSearch_Previews: PreviewProvider {
    static var previews: some View {
        CourseSearch(viewModel: CourseSearch.ViewModel())
    }
}
