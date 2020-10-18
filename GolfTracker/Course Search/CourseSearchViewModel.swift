//
//  CourseSearchViewModel.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation
import Combine

extension CourseSearch {
    class ViewModel: ObservableObject, Identifiable {

        @Published var golfCourses = [GolfCourse]()

        private var disposables = Set<AnyCancellable>()

        func getCourses() {
            Networking.getCourses()
                .receive(on: DispatchQueue.main)
                .sink { value in
                    switch value {
                    case .finished:
                        break
                    case .failure(_):
                        self.golfCourses = []
                    }
                } receiveValue: { [weak self] golfCourses in
                    self?.golfCourses = golfCourses
                }
                .store(in: &disposables)



        }
    }
}
