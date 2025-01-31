//
//  Statement.swift
//  desafio-ios
//
//  Created by Gustavo Igor Gonçalves Travassos on 12/01/21.
//

import Foundation

// MARK: - Struct

struct Statement: Decodable {
    let createdAt: String
    let id: String
    let amount: Double
    let description: String
    let tType: String
    let to: String?
    let from: String?
    var bankName: String?
    let authentication: String?
    
    var transferenceType: String {
        switch tType {
        case "PIXCASHIN":
            return "Tranferência Pix recebida"
            
        case "PIXCASHOUT":
            return "Transferência Pix realizada"
            
        case "TRANSFEROUT":
            return "Transferência realizada"
            
        case "TRANSFERIN":
            return "Transferência recebida"
            
        case "BANKSLIPCASHIN":
            return "Depósito via boleto"
            
        default:
            return "Outros"
        }
    }
    
    var amountToString: String {
        if tType.contains("IN") {
            return "\(String(amount).formatToCurrency)"
        }
        return "-\(String(amount).formatToCurrency)"
    }
}

struct StatementArray: Decodable {
    var items: [Statement]
}
