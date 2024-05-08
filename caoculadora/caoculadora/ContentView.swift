//
//  ContentView.swift
//  caoculadora
//
//  Created by Luan Bezerra Coelho on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var texto: String = ""
    @State var years: Int?
    @State var months: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $years,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
            Text("Meses")
            TextField(
                "E quantos meses além disso ele tem?",
                value: $months,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
