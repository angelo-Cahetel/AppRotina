//
//  Tarefa.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 01/08/25.
//

import Foundation

struct Tarefa: Identifiable, Codable {
    var id = UUID()
    var titulo: String
    var descricao: String
    var data: Date
    var prioridade: String
    var concluida: Bool = false
}
