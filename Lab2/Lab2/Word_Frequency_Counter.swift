import Foundation

func wordFrequencyCounter() {
    print("Enter a sentence: ", terminator: "")
    guard let input = readLine(), !input.isEmpty else {
        print("⚠️ Input cannot be empty.")
        return
    }
    
    // Приводим строку к нижнему регистру
    var text = input.lowercased()
    
    // Убираем пунктуацию (оставляем только буквы, цифры и пробелы)
    text = text.components(separatedBy: CharacterSet.punctuationCharacters).joined()
    
    // Разбиваем на слова
    let words = text.split(separator: " ").map { String($0) }
    
    // Словарь для подсчёта
    var frequency: [String: Int] = [:]
    
    for word in words {
        frequency[word, default: 0] += 1
    }
    
    // Вывод результата
    print("\n📊 Word Frequency:")
    for (word, count) in frequency {
        print("\(word): \(count)")
    }
}

