//
//  HomeView.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 30/07/25.
//

import SwiftUI

struct HomeView: View {
    @State private var tarefas = [
        ("Caminhar 30 min", false),
        ("Ler 1 capítulo da Biblia", false),
        ("Tomar café", true)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // mensagem de olá
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bom dia, Ângelo 👋")
                        .font(.title)
                        .bold()
                    Text(Date(), style: .date)
                        .foregroundStyle(.gray)
                }
                .padding(.top)
                
                // próxima taréfa
                VStack(alignment: .leading, spacing: 8) {
                    Text("Próxima tarefa")
                        .font(.headline)
                    Text("Estudar SwiftUI")
                        .font(.title3)
                    Text("10:00 - 11:30")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)
                
                // Lista de tarefas
                Text("Minhas tarefas de hoje")
                    .font(.headline)
                
                ForEach(tarefas.indices, id: \.self) { i in
                    HStack {
                        Image(systemName: tarefas[i].1 ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                tarefas[i].1.toggle()
                            }
                        Text(tarefas[i].0)
                            .strikethrough(tarefas[i].1, color: .gray)
                            .foregroundColor(tarefas[i].1 ? .gray : .primary)
                    }
                    .padding(.vertical, 4)
                }
                Spacer()
                
                // Botão nova tarefa
                Button(action: {
                    //ação de adicionar tarefa
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Nova tarefa")
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle(Text("Hoje"))
        }
    }
}

#Preview {
    HomeView()
}
