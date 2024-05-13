//
//  ContentView.swift
//  caoculadora
//
//  Created by Luan Bezerra Coelho on 07/05/24.
//

import SwiftUI

enum CBLPhase: String, CaseIterable {
    case engage
    case investigate
    case act
}

struct ContentView: View {
    
    @State var phase = CBLPhase.engage
    
    @State var years: Int?
    @State var months: Int?
    @State var result: Int?
    
    @State var size = Porte.small
    
    var body: some View {
         
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Qual a idade do seu cão?")
                .font(.header5)
            Text("Anos")
                .font(.body1)
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $years,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            
            Text("Meses")
                .font(.body1)
            TextField(
                "E quantos meses além disso ele tem?",
                value: $months,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            
            Text("Porte")
                .font(.body1)
            
            Picker("Portes", selection: $size){
                ForEach(Porte.allCases, id:\.self) {size in
                    Text(size.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 5)
            }
            
            Spacer()
            
            Button("Calcular", action: processYears)
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
        
        if(years == nil) && (months != nil){
            years = 0
        }
        
        if(months == nil) && (years != nil){
            months = 0
        }
        
        guard let years, let months else {
            print("deu ruim, vida")
            return
        }
        
        if months < 0 && years < 0 {
            print("pelo menos um campo deve ser maior que zero")
            return
        }
        
        let multiplier: Int
        
        switch size {
        case .small:
            multiplier = 6
        case .medium:
            multiplier = 7
        case .big:
            multiplier = 8
        }
        
        result = (years * multiplier) + (months * multiplier) / 12
    }
}

#Preview {
    ContentView()
}
