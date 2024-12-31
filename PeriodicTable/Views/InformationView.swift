//
//  InformationView.swift
//  PeriodicTable
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("The periodic table of chemical elements, often called the periodic table, organizes all discovered chemical elements in rows (called periods) and columns (called groups) according to increasing atomic number. Scientists use the periodic table to quickly refer to information about an element, like atomic mass and chemical symbol. The periodic table’s arrangement also allows scientists to discern trends in element properties, including electronegativity, ionization energy, and atomic radius.")
                        .textSelection(.enabled)
                } header: {
                    Text("What is the periodic table of elements?")
                } footer: {
                    Text("[Source: ACS](https://www.acs.org/education/whatischemistry/periodictable.html)")
                }
                
                Section {
                    Text("Although elements such as gold, silver, tin, copper, lead and mercury have been known since antiquity, the first scientific discovery of an element occurred in 1649 when Hennig Brand discovered **phosphorous**. During the next 200 years, a vast body of knowledge concerning the properties of elements and their compounds was acquired by chemists. By 1869, a total of 63 elements had been discovered. As the number of known elements grew, scientists began to recognize patterns in properties and began to develop classification schemes.")
                        .textSelection(.enabled)
                } header: {
                    Text("Which element was discovered first?")
                } footer: {
                    Text("[Source: WOU](https://people.wou.edu/~courtna/ch412/perhist.htm)")
                }
            }
            .navigationTitle("Information")
        }
    }
}

#Preview {
    NavigationStack {
        InformationView()
    }
}
