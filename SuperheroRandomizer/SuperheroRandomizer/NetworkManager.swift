import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchRandomHero(completion: @escaping (Result<Superhero, Error>) -> Void) {
        let randomId = Int.random(in: 1...731)
        guard let url = URL(string: "https://akabab.github.io/superhero-api/api/id/\(randomId).json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let hero = try JSONDecoder().decode(Superhero.self, from: data)
                completion(.success(hero))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
