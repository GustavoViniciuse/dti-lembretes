import SwiftUI

struct ListarLembretesView: View {
    @EnvironmentObject var store: LembreteStore
    @State private var isEditMode: EditMode = .inactive

    let azul = Color(red: 128/255, green: 222/255, blue: 234/255)

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(store.lembretesAgrupados.keys).sorted(), id: \.self) { dia in
                    Section(header:
                        Text(dia.formatted(date: .abbreviated, time: .omitted))
                            .font(.title3.bold())
                            .foregroundColor(azul)
                    ) {
                        let lembretesDoDia = store.lembretesAgrupados[dia] ?? []

                        ForEach(lembretesDoDia) { lembrete in
                            if let index = store.lembretes.firstIndex(where: { $0.id == lembrete.id }) {
                                NavigationLink(destination: DetalheLembreteView(lembrete: $store.lembretes[index])) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.ultraThinMaterial)
                                            .shadow(color: azul.opacity(0.3), radius: 4, x: 0, y: 2)

                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(lembrete.texto)
                                                .font(.headline)
                                                .foregroundColor(.white)

                                            Text(lembrete.data.formatted(date: .omitted, time: .shortened))
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        .padding()
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let lembretes = store.lembretesAgrupados[dia] ?? []
                                if index < lembretes.count {
                                    let lembrete = lembretes[index]
                                    store.remover(id: lembrete.id)
                                }
                            }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden) 
            .background(Color.black)
            .navigationTitle("Seus Lembretes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}
