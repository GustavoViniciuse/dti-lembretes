import SwiftUI

struct CriarLembreteView: View {
    @EnvironmentObject var store: LembreteStore
    @State private var texto: String = ""
    @State private var data: Date = Date()
    @State private var erro: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Digite o nome do lembrete", text: $texto)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)

                DatePicker("Selecione uma data", selection: $data, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)

                if let erro {
                    Text(erro)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                Button(action: criarLembrete) {
                    Text("Criar Lembrete")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Novo Lembrete")
        }
    }

    func criarLembrete() {
        guard !texto.trimmingCharacters(in: .whitespaces).isEmpty else {
            erro = "O campo 'Nome' é obrigatório."
            return
        }

        if data <= Date() {
            erro = "A data precisa estar no futuro."
            return
        }

        let novo = Lembrete(texto: texto, data: data)
        store.adicionar(novo)
        texto = ""
        data = Date()
        erro = nil
    }
}
