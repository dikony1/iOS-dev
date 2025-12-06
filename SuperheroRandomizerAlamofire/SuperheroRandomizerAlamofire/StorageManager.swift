import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    private init() {}
    
    private let key = "lastSelectedHero"
    
    // Сохранение героя
    func saveHero(_ hero: Superhero) {
        do {
            let data = try JSONEncoder().encode(hero)
            UserDefaults.standard.set(data, forKey: key)
            print("Hero saved successfully!")
        } catch {
            print("Failed to save hero: \(error)")
        }
    }
    
    // Загрузка героя при старте
    func loadHero() -> Superhero? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        
        do {
            let hero = try JSONDecoder().decode(Superhero.self, from: data)
            return hero
        } catch {
            print("Failed to load hero: \(error)")
            return nil
        }
    }
}
