import Foundation

// Функции для конвертации
func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fahrenheitToKelvin(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273.15
}

func kelvinToFahrenheit(_ k: Double) -> Double {
    return (k - 273.15) * 9/5 + 32
}

// Главная функция задачи
func temperatureConverter() {
    print("Enter temperature value: ", terminator: "")
    guard let valueInput = readLine(), let value = Double(valueInput) else {
        print("Invalid temperature value.")
        return
    }
    
    print("Enter unit (C for Celsius, F for Fahrenheit, K for Kelvin): ", terminator: "")
    guard let unit = readLine()?.uppercased(), ["C", "F", "K"].contains(unit) else {
        print("Invalid unit.")
        return
    }
    
    switch unit {
    case "C":
        print("\(value) °C = \(celsiusToFahrenheit(value)) °F")
        print("\(value) °C = \(celsiusToKelvin(value)) K")
    case "F":
        print("\(value) °F = \(fahrenheitToCelsius(value)) °C")
        print("\(value) °F = \(fahrenheitToKelvin(value)) K")
    case "K":
        print("\(value) K = \(kelvinToCelsius(value)) °C")
        print("\(value) K = \(kelvinToFahrenheit(value)) °F")
    default:
        print("Unknown unit.")
    }
}

