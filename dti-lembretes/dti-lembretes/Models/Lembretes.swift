import Foundation

struct Lembrete: Codable, Identifiable {
    var id = UUID()
    var texto: String
    var data: Date
    var descricao: String = ""
}
