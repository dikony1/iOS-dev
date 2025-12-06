import Foundation
import Alamofire // Импортируем библиотеку

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchRandomHero(completion: @escaping (Result<Superhero, Error>) -> Void) {
        let randomId = Int.random(in: 1...731)
        let urlStr = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        // Используем Alamofire для запроса
        AF.request(urlStr)
            .validate() // Проверяет, что статус код 200...299
            .responseDecodable(of: Superhero.self) { response in
                switch response.result {
                case .success(let hero):
                    completion(.success(hero))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
