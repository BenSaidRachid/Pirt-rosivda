//
//  Suggestion.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 23/04/2021.
//

import Foundation

enum Suggestion: CaseIterable {
    case coffees
    case restaurants
    case arts
    case health
    case animal
    case house
    case airplane
    case balloon
    case book
    
    var iconName: String {
        switch self {
            case .coffees:
                return "coffee"
            case .restaurants:
                return "restaurant"
            case .arts:
                return "palette"
            case .health:
                return "heart"
            case .animal:
                return "animal"
            case .house:
                return "house"
            case .airplane:
                return "airplane"
            case .balloon:
                return "balloon"
            case .book:
                return "book"
        }
    }
    
    var title: String {
        switch self {
            case .coffees:
                return "Cafés et thés"
            case .restaurants:
                return "Alimentation"
            case .arts:
                return "Art & Loisirs"
            case .health:
                return "Santé & Médical"
            case .animal:
                return "Animaux de compagnie"
            case .house:
                return "Immobilier"
            case .airplane:
                return "Hôtels & Séjours"
            case .balloon:
                return "Organisation d'événements"
            case .book:
                return "Formation & Enseignement"
        }
    }
}
