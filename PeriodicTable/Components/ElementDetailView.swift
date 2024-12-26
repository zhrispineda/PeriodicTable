//
//  ElementDetailView.swift
//  PeriodicTable
//

import SwiftUI

struct ElementDetailView: View {
    // Variables
    @Environment(\.dismiss) private var dismiss
    var element: Element
    var animation: Namespace.ID

    var body: some View {
        List {
            Button {
                dismiss()
            } label: {
                ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: "\(element.mass)")
            }
            .matchedTransitionSource(id: element.id, in: animation)
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            
            // Information Section
            Section("Information") {
                Group {
                    LabeledContent("Atomic Number", value: "\(element.id)")
                    LabeledContent("Atomic Mass", value: "\(element.mass)")
                    LabeledContent("Symbol", value: element.symbol)
                    LabeledContent("Name", value: element.element)
                }
                .textSelection(.enabled)
            }
        }
        .navigationTransition(.zoom(sourceID: element.id, in: animation))
    }
}

#Preview {
    ContentView()
}
