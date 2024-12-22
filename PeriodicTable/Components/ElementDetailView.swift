//
//  ElementDetailView.swift
//  PeriodicTable
//

import SwiftUI

struct ElementDetailView: View {
    // Variables
    var element: Element
    var animation: Namespace.ID

    var body: some View {
        List {
            Section {
                Text("Symbol: \(element.symbol)")
            } header: {
                Text(element.element)
            }
        }
        .navigationTransition(.zoom(sourceID: element.id, in: animation))
    }
}
