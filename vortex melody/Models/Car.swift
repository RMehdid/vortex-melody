//
//  Car.swift
//  vortex melody
//
//  Created by Samy Mehdid on 8/10/2022.
//

import Foundation
import SwiftUI

enum Company: CaseIterable {
    case Mercedes
    case BMW
    case Audi
    case Porsche
    case Hyundai
    case Toyota
    case AstonMartin
    case Peugeot
    case Volkswagen
    case Ferrari
    case Nissan
    case Seat
    case Skoda
    case Citroen
    case Renault
    
    var companyString: String {
        switch self {
        case .Mercedes:
            return "Mercedes"
        case .BMW:
            return "BMW"
        case .Audi:
            return "Audi"
        case .Porsche:
            return "Porsche"
        case .Hyundai:
            return "Hyundai"
        case .Toyota:
            return "Toyota"
        case .AstonMartin:
            return "AstonMartin"
        case .Peugeot:
            return "Peugeot"
        case .Volkswagen:
            return "Volkswagen"
        case .Ferrari:
            return "Ferrari"
        case .Nissan:
            return "Nissan"
        case .Seat:
            return "Seat"
        case .Skoda:
            return "Skoda"
        case .Citroen:
            return "Citroen"
        case .Renault:
            return "Renault"
        }
    }
    
    var categories: [Category] {
        return [.Hatchback, .Sedan, .SUV]
    }
    
    func loadSubCategories(cat: Category) -> [SubCategory] {
        var subcatlist: [SubCategory] = [.all]
        switch self {
        case .Mercedes:
            switch cat {
            case .Hatchback:
                subcatlist.append(.Aclass)
            case .SUV:
                subcatlist.append(contentsOf: [.GLA, .GLB, .GLC, .EQB, .GLE, .GLS, .EQS, .Gclass])
            case .Sedan:
                subcatlist.append(contentsOf: [.Cclass, .Eclass, .Sclass])
            }
        case .BMW:
            switch cat {
            case .Hatchback:
                subcatlist.append(.series)
            case .SUV:
                subcatlist.append(.seriesX)
            case .Sedan:
                subcatlist.append(contentsOf: [.series, .seriesM])
            }
        case .Audi:
            switch cat {
            case .Hatchback:
                subcatlist.append(.seriesA)
            case .SUV:
                subcatlist.append(.seriesQ)
            case .Sedan:
                subcatlist.append(contentsOf: [.seriesS, .seriesRS, .seriesA, .seriesTT])
            }
        case .Porsche:
            switch cat {
            case .Hatchback:
                break
            case .SUV:
                subcatlist.append(contentsOf: [.Macan, .Cayenne])
            case .Sedan:
                subcatlist.append(contentsOf: [.series911, .GT, .Panamera])
            }
        case .Hyundai:
            switch cat {
            case .Hatchback:
                subcatlist.append(.Iseries)
            case .SUV:
                break
            case .Sedan:
                break
            }
        case .Peugeot:
            switch cat {
            case .Hatchback:
                subcatlist.append(contentsOf: [.threehundred, .twohundred, .hundred])
            case .SUV:
                break
            case .Sedan:
                subcatlist.append(contentsOf: [.fourhundred, .fivehundred])
            }
        case .Volkswagen:
            switch cat {
            case .Hatchback:
                subcatlist.append(contentsOf: [.golf, .GTI, .GTD, .polo, .Rseries])
            case .SUV:
                subcatlist.append(contentsOf: [.Tiguan, .Touareg, .Touran])
            case .Sedan:
                subcatlist.append(.Scirocco)
            }
        case .Seat:
            switch cat {
            case .Hatchback:
                subcatlist.append(contentsOf: [.Ibiza, .Leon, .Cupra])
            case .SUV:
                subcatlist.append(contentsOf: [.Arona, .Ateca])
            case .Sedan:
                subcatlist.append(contentsOf: [.cordoba, .Toledo])
            }
        case .Skoda:
            switch cat {
            case .Hatchback:
                subcatlist.append(.Fabia)
            case .SUV:
                subcatlist.append(contentsOf: [.Kodiaq, .Enyac])
            case .Sedan:
                subcatlist.append(contentsOf: [.octavia, .rapid])
            }
        case .Renault:
            switch cat {
            case .Hatchback:
                subcatlist.append(contentsOf: [.Megan, .clio])
            case .SUV:
                subcatlist.append(contentsOf: [.Capture, .Arkana])
            case .Sedan:
                subcatlist.append(.Talisman)
            }
        default: break
        }
        return subcatlist
    }
}

enum SubCategory: String, CaseIterable {
    case all
    case Aclass
    case Bclass
    case Cclass
    case Eclass
    case Sclass
    case GLA
    case GLB
    case GLC
    case EQB
    case GLE
    case GLS
    case EQS
    case Gclass
    case series
    case seriesM
    case seriesX
    case seriesA
    case seriesS
    case seriesRS
    case seriesQ
    case seriesTT
    case Macan
    case Cayenne
    case series911
    case Panamera
    case GT
    case Iseries
    case Genesis
    case Veloster
    case hundred
    case twohundred
    case threehundred
    case fourhundred
    case fivehundred
    case golf
    case GTI
    case GTD
    case Rseries
    case polo
    case Scirocco
    case Tiguan
    case Touareg
    case Touran
    case Ibiza
    case Leon
    case Cupra
    case Arona
    case Ateca
    case cordoba
    case Toledo
    case Fabia
    case Kodiaq
    case Enyac
    case octavia
    case rapid
    case Megan
    case clio
    case Talisman
    case Capture
    case Arkana
}

enum Category: CaseIterable {
    case Hatchback
    case SUV
    case Sedan
    
    var CategoryString: String {
        switch self {
        case .Hatchback:
            return "Hatchback"
        case .SUV:
            return "SUV"
        case .Sedan:
            return "Sedan"
        }
    }
}

enum EngineType {
    case V
    case W
    case I
    case R
    case H
    case Single
    case Opposed
}

enum EngineConsum: CaseIterable {
    
    case petrol
    case diesel
    case hybrid
    case electric
    
    var ConsumString: String {
        switch self {
        case .petrol: return "Petrol"
        case .diesel: return "Diesel"
        case .hybrid: return "Hybrid"
        case .electric: return "Electric"
        }
    }
}

struct Car {
    let id = UUID()
    let company: Company
    let model: String
    let maxSpeed: UInt
    let engineName: String
    let engineCunsum: EngineConsum
    let horsePower: UInt
    let engineLiters: Double?
    let engineType: EngineType?
    let torque: UInt
    let category: Category?
    let subCategory: [SubCategory]
    let acceleration: Double
    let price: UInt
    let carColors: [Color]
    let cylenders: UInt?
    
    static var carrera = Car(company: .Porsche, model: "911 Carrera", maxSpeed: 293, engineName: "6ZYL", engineCunsum: .petrol, horsePower: 379, engineLiters: 2.7, engineType: .V, torque: 450, category: .Sedan, subCategory: [.series911], acceleration: 4.2, price: 106100, carColors: [Color(red: 0.94, green: 0.94, blue: 0.94), Color.black, Color(red: 0.68, green: 0, blue: 0.21), Color(red: 0.95, green: 0.80, blue: 0.19)], cylenders: 6)
    
    static var Tucson = Car(company: .Hyundai, model: "Tucson", maxSpeed: 198, engineName: "GDI", engineCunsum: .diesel, horsePower: 187, engineLiters: 2.5, engineType: .I, torque: 416, category: .SUV, subCategory: [], acceleration: 8.8, price: 30600, carColors: [], cylenders: 4)
    
    static var macan = Car(company: .Porsche, model: "Macan", maxSpeed: 229, engineName: "cc1984", engineCunsum: .petrol, horsePower: 261, engineLiters: 2.0, engineType: .I, torque: 370, category: .SUV, subCategory: [.Macan], acceleration: 6.1, price: 57500, carColors: [Color(red: 0.94, green: 0.94, blue: 0.94), Color.black], cylenders: 4)
    
    static var taycan = Car(company: .Porsche, model: "Taycan", maxSpeed: 230, engineName: "2 Acsync", engineCunsum: .electric, horsePower: 402, engineLiters: nil, engineType: nil, torque: 345, category: nil, subCategory: [], acceleration: 5.4, price: 86700, carColors: [Color(red: 0.94, green: 0.94, blue: 0.94), Color.black], cylenders: nil)
    
    static var WVserie7R = Car(company: .Volkswagen, model: "Golf MK7 R", maxSpeed: 250, engineName: "TFSi", engineCunsum: .petrol, horsePower: 300, engineLiters: 2.0, engineType: .I, torque: 380, category: .Hatchback, subCategory: [.golf, .Rseries], acceleration: 5.5, price: 57190, carColors: [], cylenders: 4)
    
    static var S3 = Car(company: .Audi, model: "S3", maxSpeed: 250, engineName: "TFSi", engineCunsum: .petrol, horsePower: 296, engineLiters: 2.0, engineType: .I, torque: 480, category: .Hatchback, subCategory: [.seriesS], acceleration: 4.8, price: 44000, carColors: [], cylenders: 4)
    
    static var RS3 = Car(company: .Audi, model: "RS3", maxSpeed: 250, engineName: "TFSi", engineCunsum: .petrol, horsePower: 294, engineLiters: 2.5, engineType: .I, torque: 500, category: .Hatchback, subCategory: [.seriesRS], acceleration: 3.8, price: 56000, carColors: [], cylenders: 5)
    
    static var M5 = Car(company: .BMW, model: "M5", maxSpeed: 305, engineName: "4395 cc", engineCunsum: .petrol, horsePower: 617, engineLiters: 4.4, engineType: .V, torque: 750, category: .Sedan, subCategory: [.seriesM], acceleration: 3.3, price: 105000, carColors: [], cylenders: 8)
    
    static var cars: [Car] = [.carrera, .Tucson ,.macan, .taycan, .WVserie7R, .S3, .RS3, .M5]
}
