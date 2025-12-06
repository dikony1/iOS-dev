import UIKit
import Kingfisher // Импорт для картинок

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    // Stats
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    
    // Details
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    @IBOutlet weak var randomizeButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Требование №4: Проверяем UserDefaults при запуске
        if let savedHero = StorageManager.shared.loadHero() {
            print("Restoring saved hero...")
            updateUI(with: savedHero)
        } else {
            // Если сохранений нет, грузим случайного
            fetchHero()
        }
    }

    private func setupUI() {
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        
        // Добавляем индикатор загрузки Kingfisher
        heroImageView.kf.indicatorType = .activity
    }

    // MARK: - IBActions
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        fetchHero()
    }
    
    // MARK: - Logic
    
    private func fetchHero() {
        randomizeButton.isEnabled = false
        
        NetworkManager.shared.fetchRandomHero { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.randomizeButton.isEnabled = true
                
                switch result {
                case .success(let hero):
                    // Требование №4: Сохраняем успешный результат
                    StorageManager.shared.saveHero(hero)
                    
                    self.updateUI(with: hero)
                    
                case .failure(let error):
                    self.showError(message: error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI(with hero: Superhero) {
        // Анимация (Bonus)
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            // 1. Kingfisher: Загрузка изображения
            if let url = URL(string: hero.images.md) {
                // Используем .kf.setImage вместо старого расширения
                self.heroImageView.kf.setImage(
                    with: url,
                    placeholder: UIImage(systemName: "photo"),
                    options: [
                        .transition(.fade(0.2)), // Плавное появление
                        .cacheOriginalImage
                    ]
                )
            }
            
            // 2. Текстовые данные (Более 10 атрибутов)
            self.nameLabel.text = hero.name
            self.fullNameLabel.text = hero.biography.fullName.isEmpty ? "Unknown Identity" : hero.biography.fullName
            
            self.intelligenceLabel.text = "🧠 Intelligence: \(hero.powerstats.intelligence)"
            self.strengthLabel.text = "💪 Strength: \(hero.powerstats.strength)"
            self.speedLabel.text = "⚡️ Speed: \(hero.powerstats.speed)"
            self.durabilityLabel.text = "🛡 Durability: \(hero.powerstats.durability)"
            self.powerLabel.text = "🔥 Power: \(hero.powerstats.power)"
            self.combatLabel.text = "⚔️ Combat: \(hero.powerstats.combat)"
            
            self.genderLabel.text = "Gender: \(hero.appearance.gender)"
            self.raceLabel.text = "Race: \(hero.appearance.race ?? "Unknown")"
            self.publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")"
            
            let align = hero.biography.alignment.uppercased()
            self.alignmentLabel.text = "Alignment: \(align)"
            self.alignmentLabel.textColor = (align == "GOOD") ? .systemGreen : .systemRed
            
        }, completion: nil)
    }
    
    private func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
