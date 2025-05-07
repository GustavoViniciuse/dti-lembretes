import SwiftUI

struct ContentView: View {
    @StateObject var store = LembreteStore()

    let azul = Color(red: 77/255, green: 208/255, blue: 225/255)

    var body: some View {
        TabView {
            CriarLembreteView()
                .tabItem {
                    Label("Criar", systemImage: "square.and.pencil")
                }

            ListarLembretesView()
                .tabItem {
                    Label("Lembretes", systemImage: "text.badge.checkmark")
                }
        }
        .accentColor(azul)
        .environmentObject(store)
    }
}
