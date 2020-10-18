//
//  StatsViewModel.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import Foundation

extension StatsView {

    enum TeeShotAccuracy {
        case left
        case fairway
        case right
    }

    enum UpAndDownState {
        case none
        case yes
        case no
    }

    class ViewModel: ObservableObject, Identifiable {


        let objectWillChange = ObjectWillChangePublisher()

        var hole = 1
        var holeHdcp = 3
        var holePar = 4
        var strokes = 4 {
            willSet {
                objectWillChange.send()
            }
        }
        var accuracy: TeeShotAccuracy = .left
        var putts = 2 {
            willSet {
                objectWillChange.send()
            }
        }
        var firstPuttLength = ""
        private(set) var upAndDown: UpAndDownState? {
            willSet {
                objectWillChange.send()
            }
        }

        func toggle(upAndDown: UpAndDownState) {
            if self.upAndDown == upAndDown {
                self.upAndDown = nil
            } else {
                self.upAndDown = upAndDown
            }

        }

    }
}
