//
//  TaskManeger.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 01/08/25.
//

import Foundation

class TaskManeger: ObservableObject {
    @Published var tarefas: [Tarefa] = [] {
        didSet {
            salvarTarefas()
        }
    }
    
    let chave = "tarefas_salvas"
    
    init() {
        carregarTarefas()
    }
    
    func adicionar(_ tarefa: Tarefa) {
        tarefas.append(tarefa)
    }
    
    func alternarConclusao(id: UUID) {
        if let index = tarefas.firstIndex(where: {$0.id == id}) {
            tarefas[index].concluida.toggle()
        }
    }
    
    func salvarTarefas() {
        if let data = try? JSONEncoder().encode(tarefas) {
            UserDefaults.standard.set(data, forKey: chave)
        }
    }
    
    func carregarTarefas() {
        if let data = UserDefaults.standard.data(forKey: chave),
           let salvas = try? JSONDecoder().decode([Tarefa].self, from: data) {
            self.tarefas = salvas
        }
    }
}
