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
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    
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
            
            Picker("Portes", selection: $porteSelecionado){
                ForEach(portes, id:\.self) {porte in
                    Text(porte)
                }
            }
            .pickerStyle(.segmented)
            
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
                    .shadow(radius: 5)
            }
            
            Spacer()
            
            Button("Calcular", action: processYears)
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 50)
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding()
    }
    
    func processYears(){
        print("cãocular")
        
        guard let years, let months else {
            print("deu ruim, vida")
            return
        }
        
        if months < 0 && years < 0 {
            print("pelo menos um campo deve ser maior que zero")
            return
        }
        
        let multiplicador: Int
        
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        
        result = (years * multiplicador) + (months * multiplicador) / 12
    }
}

#Preview {
    ContentView()
}
