import SwiftUI

struct DetalheLembreteView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var lembrete: Lembrete

    @State private var novoTexto: String = ""
    @State private var novaData: Date = Date()
    @State private var novaDescricao: String = ""
    @State private var erro: String?

    init(lembrete: Binding<Lembrete>) {
        self._lembrete = lembrete
        _novoTexto = State(initialValue: lembrete.wrappedValue.texto)
        _novaData = State(initialValue: lembrete.wrappedValue.data)
        _novaDescricao = State(initialValue: lembrete.wrappedValue.descricao)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        Text("Nome")
                            .font(.headline)
                        TextField("Digite o nome", text: $novoTexto)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Text("Data e Hora")
                            .font(.headline)
                        DatePicker("Selecionar data", selection: $novaData, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()

                        Text("Descrição")
                            .font(.headline)
                        TextEditor(text: $novaDescricao)
                            .frame(minHeight: 100)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
                    }

                    if let erro {
                        Text(erro)
                            .foregroundColor(.red)
                    }

                    Button("Salvar") {
                        if novoTexto.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            erro = "O nome do lembrete não pode estar vazio."
                            return
                        }

                        if novaData < Date() {
                            erro = "A data deve ser no futuro."
                            return
                        }

                        lembrete.texto = novoTexto
                        lembrete.data = novaData
                        lembrete.descricao = novaDescricao

                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Cancelar", role: .cancel) {
                        dismiss()
                    }
                    .padding(.top, 4)
                }
                .padding()
            }
            .navigationTitle("Editar Lembrete")

        }
    }
}
