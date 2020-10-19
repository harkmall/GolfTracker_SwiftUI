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

        typealias GetCourses = (String) -> AnyPublisher<[GolfCourse], Error>

        //outputs
        @Published var golfCourses = [GolfCourse]()

        //inputs
        @Published var query = ""

        private var disposables = Set<AnyCancellable>()

        init(courseSupplier: @escaping GetCourses = Networking.getCourses) {
            $query
                .filter { $0.isEmpty }
                .map { _ in [GolfCourse]() }
                .assign(to: \.golfCourses, on: self)
                .store(in: &disposables)

            $query
                .filter { !$0.isEmpty }
                .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
                .flatMap {
                    courseSupplier($0)
                }
                .receive(on: DispatchQueue.main)
                .sink { [weak self] value in
                    switch value {
                    case .finished:
                        break
                    case .failure(_):
                        self?.golfCourses = []
                    }
                } receiveValue: { [weak self] golfCourses in
                    self?.golfCourses = golfCourses
                }
                .store(in: &disposables)
        }
    }
}
