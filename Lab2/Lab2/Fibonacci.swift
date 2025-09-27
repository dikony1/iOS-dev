import Foundation

func fibonacci(_ n: Int) -> [Int] {
    // Если n <= 0 → возвращаем пустой массив
    if n <= 0 {
        return []
    }
    // Если n == 1 → возвращаем [0]
    if n == 1 {
        return [0]
    }
    
    // Начальные числа Фибоначчи
    var sequence = [0, 1]
    
    // Вычисляем оставшиеся числа
    for i in 2..<n {
        let next = sequence[i - 1] + sequence[i - 2]
        sequence.append(next)
    }
    
    return sequence
}

// Главная функция задачи
func fibonacciTask() {
    print("Enter n (number of Fibonacci terms): ", terminator: "")
    if let input = readLine(), let n = Int(input) {
        let sequence = fibonacci(n)
        if sequence.isEmpty {
            print("⚠️ Invalid input. n must be > 0.")
        } else {
            print("📊 First \(n) Fibonacci numbers:")
            print(sequence.map { String($0) }.joined(separator: ", "))
        }
    } else {
        print("⚠️ Please enter a valid integer.")
    }
}

