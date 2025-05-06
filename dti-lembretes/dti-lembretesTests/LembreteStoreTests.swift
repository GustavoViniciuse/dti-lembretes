import XCTest
@testable import dti_lembretes

final class LembreteStoreTests: XCTestCase {

    var store: LembreteStore!

    override func setUp() {
        super.setUp()
        store = LembreteStore()
        store.lembretes = []  // Limpa qualquer lembrete persistido
    }

    override func tearDown() {
        store = nil
        super.tearDown()
    }

    func testAdicionarLembrete() {
        let lembrete = Lembrete(id: UUID(), texto: "Teste", data: Date().addingTimeInterval(3600), descricao: "Descrição de teste")
        store.adicionar(lembrete)

        XCTAssertEqual(store.lembretes.count, 1)
        XCTAssertEqual(store.lembretes.first?.texto, "Teste")
    }

    func testRemoverLembrete() {
        let lembrete = Lembrete(id: UUID(), texto: "Remover", data: Date(), descricao: "")
        store.adicionar(lembrete)
        store.remover(id: lembrete.id)

        XCTAssertTrue(store.lembretes.isEmpty)
    }

    func testAtualizarLembrete() {
        let id = UUID()
        let original = Lembrete(id: id, texto: "Original", data: Date(), descricao: "Desc")
        store.adicionar(original)

        let atualizado = Lembrete(id: id, texto: "Atualizado", data: Date().addingTimeInterval(600), descricao: "Nova desc")
        store.atualizar(atualizado)

        XCTAssertEqual(store.lembretes.first?.texto, "Atualizado")
        XCTAssertEqual(store.lembretes.first?.descricao, "Nova desc")
    }

    func testSalvarECarregar() {
        let lembrete = Lembrete(id: UUID(), texto: "Persistência", data: Date(), descricao: "Testando persistência")
        store.adicionar(lembrete)

        let novoStore = LembreteStore()
        XCTAssertTrue(novoStore.lembretes.contains(where: { $0.id == lembrete.id }))
    }

    func testLembretesAgrupadosPorData() {
        let hoje = Calendar.current.startOfDay(for: Date())
        let amanha = Calendar.current.date(byAdding: .day, value: 1, to: hoje)!

        let l1 = Lembrete(id: UUID(), texto: "Hoje", data: hoje, descricao: "")
        let l2 = Lembrete(id: UUID(), texto: "Amanhã", data: amanha, descricao: "")

        store.adicionar(l1)
        store.adicionar(l2)

        let agrupados = store.lembretesAgrupados
        XCTAssertEqual(agrupados[hoje]?.count, 1)
        XCTAssertEqual(agrupados[amanha]?.count, 1)
    }
}

