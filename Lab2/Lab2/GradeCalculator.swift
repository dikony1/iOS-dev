import Foundation

func gradeCalculator() {
    print("Enter number of students: ", terminator: "")
    guard let input = readLine(), let count = Int(input), count > 0 else {
        print("⚠️ Invalid number of students.")
        return
    }
    
    var students: [(name: String, score: Double)] = []
    
    // Вводим данные студентов
    for i in 1...count {
        print("Enter name of student \(i): ", terminator: "")
        let name = readLine() ?? "Unknown"
        
        print("Enter score for \(name): ", terminator: "")
        guard let scoreInput = readLine(), let score = Double(scoreInput) else {
            print("⚠️ Invalid score. Setting score = 0.")
            students.append((name, 0))
            continue
        }
        
        students.append((name, score))
    }
    
    // Находим средний, макс и мин
    let scores = students.map { $0.score }
    let average = scores.reduce(0, +) / Double(scores.count)
    let maxScore = scores.max() ?? 0
    let minScore = scores.min() ?? 0
    
    print("\n📊 Results:")
    print("Average score: \(String(format: "%.2f", average))")
    print("Highest score: \(maxScore)")
    print("Lowest score: \(minScore)\n")
    
    // Вывод по каждому студенту
    for student in students {
        let status = student.score >= average ? "✅ Above average" : "⬇️ Below average"
        print("\(student.name): \(student.score) — \(status)")
    }
}

