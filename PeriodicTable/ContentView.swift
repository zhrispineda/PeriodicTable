//
//  ContentView.swift
//  PeriodicTable
//

import SwiftUI

struct ContentView: View {
    // Variables
    @Namespace var animation
    @State private var selected: Element?
    var elements: [Element] = ElementModel().load("Elements.json")
    
    var body: some View {
        NavigationStack {
            ScrollView([.horizontal, .vertical]) {
                LazyHStack(alignment: .top) {
                    ForEach(1..<19) { column in
                        LazyVStack(alignment: .leading) {
                            ForEach(1..<10) { row in
                                // Display matching element based on column and row, otherwise display blank space
                                if let element = elements.first(where: { $0.column == column && $0.row == row }) {
                                    Button {
                                        selected = element
                                    } label: {
                                        ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: element.mass)
                                            .contextMenu {
                                                Button {
                                                    UIPasteboard.general.string = element.element
                                                } label: {
                                                    Label(element.element, systemImage: "document.on.document")
                                                }
                                                
                                                Button {
                                                    UIPasteboard.general.string = "\(element.mass) u"
                                                } label: {
                                                    Label("\(element.mass) u", systemImage: "document.on.document")
                                                }
                                            }
                                    }
                                    .matchedTransitionSource(id: element.id, in: animation)
                                } else {
                                    Rectangle()
                                        .frame(width: 100, height: 130)
                                        .opacity(0)
                                }
                            }
                        }
                        
                        // Add spacing in-between rows 3 and 4
                        if column == 3 {
                            Rectangle()
                                .opacity(0)
                        }
                    }
                }
                .sheet(item: $selected) { element in
                    // Allows for zoom transition to ElementDetailView when tapping an element
                    ElementDetailView(element: element, animation: animation)
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .contentMargins(10, for: .scrollContent)
            .navigationTitle("Periodic Table")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
