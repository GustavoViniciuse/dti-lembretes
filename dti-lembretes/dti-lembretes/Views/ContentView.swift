import SwiftUI

struct ContentView: View {
    @StateObject var store = LembreteStore()

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
        .tint(.blue)
        .environmentObject(store)
    }
}

