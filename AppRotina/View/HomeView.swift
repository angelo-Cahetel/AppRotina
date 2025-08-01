//
//  HomeView.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 30/07/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: TaskManeger
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
               Text("Bom dia, Ângelo!")
                    .font(.title)
                    .bold()
                Text(Date(), style: .date)
                    .foregroundColor(.gray)
                
                if let proxima = manager.tarefas.filter({ !$0.concluida }).sorted(by:{ $0.data < $1.data}).first {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Próxima tarefa")
                            .font(.headline)
                        Text(proxima.titulo)
                            .font(.title3)
                        Text(proxima.data.formatted(date: .omitted, time: .shortened))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
                
                Text("Minhas tarefas de hoje")
                    .font(.headline)
                
                List {
                    ForEach(manager.tarefas) { tarefa in
                        HStack {
                            Image(systemName: tarefa.concluida ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    manager.alternarConclusao(id: tarefa.id)
                                }
                            VStack(alignment: .leading) {
                                Text(tarefa.titulo)
                                    .strikethrough(tarefa.concluida, color: .gray)
                                    .foregroundColor(tarefa.concluida ? .gray : .primary)
                                Text(tarefa.data.formatted(date: .omitted, time: .shortened))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
                NavigationLink(destination: NovaTarefaView()) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Nova Tarefa")
                            .bold()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Hoje")
        }
    }
}

#Preview {
    HomeView()
}
