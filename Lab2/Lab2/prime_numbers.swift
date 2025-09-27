func primeNumbers() {
    func isPrime(_ number: Int) -> Bool {
        if number < 2 { return false }
        for i in 2...Int(Double(number).squareRoot()) {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
    
    print("Prime numbers from 1 to 100:")
    for n in 1...100 {
        if isPrime(n) {
            print(n)
        }
    }
}


