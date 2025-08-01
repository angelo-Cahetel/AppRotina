//
//  NovaTarefaView.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 01/08/25.
//

import SwiftUI

struct NovaTarefaView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var manager: TaskManeger
    
    @State var titulo: String = ""
    @State var descricao: String = ""
    @State var dataHora: Date = Date()
    @State var prioridade: String = "Média"
    @State var mostrarAlerta: Bool = false
    
    let opcoesPrioridade = ["Alta", "Média", "Baixa"]
    
    var body: some View {
        Form {
            Section(header: Text("Título"))  {
                TextField("Ex: Estudar SwiftUI", text: $titulo)
            }
            
            Section(header: Text("Descrição")) {
                TextEditor(text: $descricao)
                    .frame(height: 100)
            }
            
            Section(header: Text("Data e Hora")) {
                DatePicker("Selecionar", selection: $dataHora, displayedComponents: [.date, .hourAndMinute])
            }
            
            Section(header: Text("Prioridade")) {
                Picker("Prioridade", selection: $prioridade) {
                    ForEach(opcoesPrioridade, id: \.self) { prioridade in
                        Text(prioridade)
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section {
                Button("Salvar tarefa") {
                    if titulo.trimmingCharacters(in: .whitespaces).isEmpty {
                        mostrarAlerta = true
                    } else {
                        let nova = Tarefa(
                            titulo: titulo,
                            descricao: descricao,
                            data: dataHora,
                            prioridade: prioridade
                        )
                        manager.adicionar(nova)
                        dismiss()
                    }
                }
                .foregroundColor(.blue)
                .alert("Titluo obrigado!", isPresented: $mostrarAlerta) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
        .navigationTitle("Nova Tarefa")
    }
}

#Preview {
    NovaTarefaView()
}
