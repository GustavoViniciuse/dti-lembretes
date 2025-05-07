import SwiftUI

struct DetalheLembreteView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var lembrete: Lembrete

    @State private var novoTexto: String = ""
    @State private var novaData: Date = Date()
    @State private var novaDescricao: String = ""
    @State private var erro: String?

    let azul = Color(red: 128/255, green: 222/255, blue: 234/255)

    init(lembrete: Binding<Lembrete>) {
        self._lembrete = lembrete
        _novoTexto = State(initialValue: lembrete.wrappedValue.texto)
        _novaData = State(initialValue: lembrete.wrappedValue.data)
        _novaDescricao = State(initialValue: lembrete.wrappedValue.descricao)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    TextField("Nome do lembrete", text: $novoTexto)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.1))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(azul.opacity(0.7), lineWidth: 1.2))
                        .foregroundColor(azul)
                        .cornerRadius(12)
                        .accentColor(azul)

                    DatePicker("Selecionar data", selection: $novaData, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.1))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(azul.opacity(0.7), lineWidth: 1.2))
                        .cornerRadius(12)
                        .foregroundColor(azul)

                    TextEditor(text: $novaDescricao)
                        .frame(minHeight: 100)
                        .padding()
                        .background(Color(.systemGray6).opacity(0.1))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(azul.opacity(0.7), lineWidth: 1.2))
                        .cornerRadius(12)
                        .foregroundColor(.white)

                    if let erro {
                        Text(erro)
                            .foregroundColor(.red)
                            .font(.caption)
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
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 77/255, green: 208/255, blue: 225/255),
                                azul
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .foregroundColor(.black)
                    .cornerRadius(14)
                    .shadow(color: azul.opacity(0.5), radius: 10, x: 0, y: 5)

                    Button("Cancelar", role: .cancel) {
                        dismiss()
                    }
                    .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Editar Lembrete")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}
