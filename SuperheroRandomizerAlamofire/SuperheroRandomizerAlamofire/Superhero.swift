import Foundation

// Добавляем Codable для парсинга JSON и сохранения в UserDefaults
struct Superhero: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: HeroImage
}

struct Powerstats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Appearance: Codable {
    let gender: String
    let race: String?
}

struct Biography: Codable {
    let fullName: String
    let publisher: String?
    let alignment: String
    let placeOfBirth: String // Добавим место рождения для доп. атрибутов
}

struct HeroImage: Codable {
    let md: String
}
