//
//  CourseCell.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-18.
//

import SwiftUI

struct CourseCell: View {

    let course: GolfCourse

    init(course: GolfCourse) {
        self.course = course
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.course.name ?? "")
                .font(.headline)
            Text("\(self.course.address?.city ?? ""), \(self.course.address?.state ?? "")")
                .font(.subheadline)
        }
    }
}
