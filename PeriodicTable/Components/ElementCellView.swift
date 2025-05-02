//
//  ElementCellView.swift
//  PeriodicTable
//

import SwiftUI

struct ElementCellView: View {
    let element: String
    let symbol: String
    let atomicNumber: Int
    let atomicMass: String
    
    var body: some View {
        VStack {
            HStack {
                Text("\(atomicNumber)") // Atomic Number
                    .bold()
                Spacer()
                Text(atomicMass) // Atomic Mass
            }
            Spacer()
            Text(symbol) // Symbol
                .fontWeight(.bold)
                .font(.system(size: 50))
            Spacer()
            Text(element) // Element
        }
        .foregroundStyle(.white)
        .padding(10)
        .frame(width: 100, height: 130)
        .font(.footnote)
        .background(Color.blue.gradient.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
    ContentView()
}
