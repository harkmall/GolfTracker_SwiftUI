//
//  StatsView.swift
//  GolfTracker
//
//  Created by Mark Hall on 2020-10-17.
//

import SwiftUI

struct StatsView: View {

    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Hole \(viewModel.hole)")
                    .fontWeight(.bold)
                    .font(.title)
                HStack {
                    Text("Par \(viewModel.holePar)")
                    Text("Handicap \(viewModel.holeHdcp)")
                }
            }

            HStack {
                Stepper("Strokes: \(viewModel.strokes)", value: $viewModel.strokes, in: 0...viewModel.holePar + 5)
            }

            HStack {
                Text("Accuracy")
                Picker("Accuracy", selection: $viewModel.accuracy) {
                    Image(systemName: "arrow.left").tag(TeeShotAccuracy.left)
                    Image(systemName: "circle").tag(TeeShotAccuracy.fairway)
                    Image(systemName: "arrow.right").tag(TeeShotAccuracy.right)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            HStack {
                Stepper("Putts: \(viewModel.putts)", value: $viewModel.putts, in: 0...max(0, viewModel.strokes - 1))
            }

            HStack {
                Text("First putt length")
                TextField("Feet", text: $viewModel.firstPuttLength)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Text("Up & Down")
                Spacer()
                HStack {
                    Button(action: {
                        viewModel.toggle(upAndDown: .yes)
                    }) {
                        Image(systemName: viewModel.upAndDown == .yes ? "checkmark.circle.fill" : "checkmark.circle")
                    }
                    Button(action: {
                        viewModel.toggle(upAndDown: .no)
                    }) {
                        Image(systemName: viewModel.upAndDown == .no ? "xmark.circle.fill" : "xmark.circle")
                    }
                }
            }

            Spacer()

            HStack {
                Button("Previous Hole") {

                }
                Spacer()
                Button("Next Hole") {

                }
            }
        }
        .padding()
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(viewModel: StatsView.ViewModel())
    }
}
