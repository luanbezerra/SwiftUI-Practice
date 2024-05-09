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
    @State var result: Int?
    
    var body: some View {
            
        VStack(alignment: .leading) {
            
            Text("Qual a idade do seu cão?")
                .padding()
            Text("Anos")
                .padding()
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $years,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
            
            Text("Meses")
                .padding()
            TextField(
                "E quantos meses além disso ele tem?",
                value: $months,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .padding()
                Text("\(result) anos")
                    .padding()
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            
            Button(action: {
                result = 23
            })
            {
                Text("Calculá")
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 50)
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
