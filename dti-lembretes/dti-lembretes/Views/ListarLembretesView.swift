import SwiftUI

struct ListarLembretesView: View {
    @EnvironmentObject var store: LembreteStore
    @State private var isEditMode: EditMode = .inactive

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(store.lembretesAgrupados.keys).sorted(), id: \.self) { dia in
                    Section(header:
                        Text(dia.formatted(date: .abbreviated, time: .omitted))
                            .font(.title3.bold())
                            .foregroundColor(.blue)
                    ) {
                        let lembretesDoDia = store.lembretesAgrupados[dia] ?? []

                        ForEach(lembretesDoDia) { lembrete in
                            if let index = store.lembretes.firstIndex(where: { $0.id == lembrete.id }) {
                                NavigationLink(destination: DetalheLembreteView(lembrete: $store.lembretes[index])) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.ultraThinMaterial)
                                            .shadow(radius: 2)

                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(lembrete.texto)
                                                .font(.headline)
                                                .foregroundColor(.primary)

                                            Text(lembrete.data.formatted(date: .omitted, time: .shortened))
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
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
            .navigationTitle("Seus Lembretes")
            .toolbar {
                EditButton()
            }
            .environment(\.editMode, $isEditMode)
        }
    }
}
