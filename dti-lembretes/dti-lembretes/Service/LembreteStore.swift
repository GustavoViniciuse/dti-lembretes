import Foundation

class LembreteStore: ObservableObject {
    @Published var lembretes: [Lembrete] = []

    private let chave = "lembretes"

    init() {
        carregar()
    }

    func adicionar(_ lembrete: Lembrete) {
        lembretes.append(lembrete)
        salvar()
    }

    func remover(id: UUID) {
        lembretes.removeAll { $0.id == id }
        salvar()
    }

    func atualizar(_ lembrete: Lembrete) {
        if let index = lembretes.firstIndex(where: { $0.id == lembrete.id }) {
            lembretes[index] = lembrete
            salvar()
        }
    }

    private func salvar() {
        if let dados = try? JSONEncoder().encode(lembretes) {
            UserDefaults.standard.set(dados, forKey: chave)
        }
    }

    private func carregar() {
        if let dados = UserDefaults.standard.data(forKey: chave),
           let salvos = try? JSONDecoder().decode([Lembrete].self, from: dados) {
            lembretes = salvos
        }
    }

    var lembretesAgrupados: [Date: [Lembrete]] {
        let calendario = Calendar.current
        let grupos = Dictionary(grouping: lembretes) {
            calendario.startOfDay(for: $0.data)
        }
        return grupos
            .mapValues { $0.sorted { $0.data < $1.data } }
            .sorted { $0.key < $1.key }
            .reduce(into: [:]) { $0[$1.key] = $1.value }
    }
}

