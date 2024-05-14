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
    @State var colorr: Color = .green
    
    var body: some View {
         
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .foregroundColor(.indigo600)
                        .padding(.top, 23)
                        .padding(.bottom, 29)
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Anos")
                            .font(.body1)
                            .foregroundColor(.indigo600)
                        TextField(
                            "Quantos anos completos tem seu cão?",
                            value: $years,
                            format: .number
                        )
                    }
                    
//                    ZStack{
//                        Color(colorr)
//                        Button("Mudar de cor", action: {
//                            colorr = .pink
//                        })
//                        .animation(.easeIn, value: colorr)
//                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Meses")
                            .font(.body1)
                            .foregroundColor(.indigo600)
                        TextField(
                            "E quantos meses além disso ele tem?",
                            value: $months,
                            format: .number
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 21){
                        Text("Porte")
                            .font(.body1)
                            .foregroundColor(.indigo600)
                        
                        Picker("Portes", selection: $size){
                            ForEach(Porte.allCases, id:\.self) {size in
                                Text(size.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
//                    Divider()
//                        .background(.indigo600)
                                    
                    if let result {
                        Text("Seu cachorro tem, em idade humana...")
                            .foregroundColor(.indigo600)
                            .frame(maxWidth: .infinity)
                            .font(.body1)
                            .padding(.bottom, 45)

                        Text("\(result) anos")
                            .foregroundColor(.indigo600)
                            .frame(maxWidth: .infinity)
                            .font(.display)
                    } else {
                        Spacer()
                        Image(ImageResource.clarinha2)
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
                    .background(Color.indigo600)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
            .containerRelativeFrame(.vertical)
            }
            .navigationTitle("Cãoculadora")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.indigo600, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .fontDesign(.rounded)
    }
    
}

//MARK: - Functions
extension ContentView {
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
        
        result = size.calculateAge(of: years, and: months)
        
    }
}

#Preview {
    ContentView()
}
