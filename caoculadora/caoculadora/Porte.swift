//
//  Porte.swift
//  caoculadora
//
//  Created by Luan Bezerra Coelho on 13/05/24.
//

import Foundation

enum Size: String, CaseIterable {
    case small = "Pequeno"
    case medium = "Médio"
    case big = "Grande"
    
    func calculateAge(of years: Int, and months: Int) -> Int {

        switch self {
        case .small:
            return (6*years) + (6*months)/12
        case .medium:
            return (7*years) + (7*months)/12
        case .big:
            return (8*years) + (8*months)/12
        }
    }
}
