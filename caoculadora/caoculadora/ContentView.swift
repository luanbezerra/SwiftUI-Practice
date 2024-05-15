//
//  ContentView.swift
//  caoculadora
//
//  Created by Luan Bezerra Coelho on 07/05/24.
//

import SwiftUI

struct ContentView: View {
        
    @State var years: Int?
    @State var months: Int?
    @State var result: Int?
    @State var size = Size.small
    @State var empty: Bool = false
    @State var negative: Bool = false
    
    let emptyMsg = "Preencha pelo menos um campo para calcular"
    let negativeMsg = "A idade não pode ser negativa"
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .foregroundColor(.indigo600)
                        .padding(.top, 20)
                        .padding(.bottom, 30)
                    
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
                            ForEach(Size.allCases, id:\.self) {size in
                                Text(size.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    if let result {
                        Text("Seu cachorro tem, em idade humana...")
                            .foregroundColor(.indigo600)
                            .frame(maxWidth: .infinity)
                            .font(.body1)
                    
                        Spacer()
                        
                        if(result == 1){
                            Text("\(result) ano")
                                .foregroundColor(.indigo600)
                                .frame(maxWidth: .infinity)
                                .font(.display)
                                .contentTransition(.numericText())
                        }
                        else{
                            Text("\(result) anos")
                                .foregroundColor(.indigo600)
                                .frame(maxWidth: .infinity)
                                .font(.display)
                                .contentTransition(.numericText())
                        }
                        
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
                    
                    Button(action: processYears) {
                        Text("Cãocular")
                         .frame(height: 50)
                         .frame(maxWidth: .infinity)
                         .frame(alignment: .bottom)
                         .background(.indigo600)
                         .clipShape(.rect(cornerRadius: 10))
                         .foregroundStyle(.white)
                         .font(.body1)
                    }
                    
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .padding()
                .containerRelativeFrame(.vertical)
                .animation(.easeInOut, value: result)
                .alert(emptyMsg, isPresented: $empty){
                    Button("OK", role: .cancel, action: {})
                }
                .alert(negativeMsg, isPresented: $negative){
                    Button("OK", role: .cancel, action: {})
                }
                
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
            self.empty = true
            return
        }
        
        if months < 0 || years < 0 {
            self.negative = true
            return
        }
        
        result = size.calculateAge(of: years, and: months)
        
    }
}

#Preview {
    ContentView()
}
