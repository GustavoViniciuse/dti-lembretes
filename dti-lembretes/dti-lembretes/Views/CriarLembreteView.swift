import SwiftUI

struct CriarLembreteView: View {
    @EnvironmentObject var store: LembreteStore
    @State private var texto: String = ""
    @State private var data: Date = Date()
    @State private var erro: String?

    let azul = Color(red: 128/255, green: 222/255, blue: 234/255)

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Digite o nome do lembrete", text: $texto)
                    .padding()
                    .background(Color(.systemGray6).opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(azul.opacity(0.7), lineWidth: 1.2)
                    )
                    .foregroundColor(azul)
                    .cornerRadius(12)
                    .accentColor(azul)

                DatePicker("Selecione uma data", selection: $data, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                    .padding()
                    .background(Color(.systemGray6).opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(azul.opacity(0.7), lineWidth: 1.2)
                    )
                    .cornerRadius(12)
                    .foregroundColor(azul)

                if let erro {
                    Text(erro)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.top, -10)
                }

                Button(action: criarLembrete) {
                    Text("Criar Lembrete")
                        .bold()
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
                }
            }
            .padding()
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Novo Lembrete")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .preferredColorScheme(.dark) 
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
