import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    // Эти названия точно совпадают с теми, что в твоем Storyboard XML
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
        
        // Немного настройки UI
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        
        // Загружаем первого героя сразу при запуске
        fetchHero()
    }

    // MARK: - IBActions
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        fetchHero()
    }
    
    // MARK: - Logic
    
    private func fetchHero() {
        // Показываем пользователю, что идет загрузка
        randomizeButton.isEnabled = false
        randomizeButton.setTitle("Loading...", for: .normal)
        
        NetworkManager.shared.fetchRandomHero { [weak self] result in
            DispatchQueue.main.async {
                self?.randomizeButton.isEnabled = true
                self?.randomizeButton.setTitle("Randomize Superhero", for: .normal)
                
                switch result {
                case .success(let hero):
                    self?.updateUI(with: hero)
                case .failure(let error):
                    self?.showError(message: error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI(with hero: Superhero) {
        // Анимация обновления текста
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            // Загрузка картинки
            if let url = URL(string: hero.images.md) {
                self.heroImageView.load(url: url)
            }
            
            // Основная информация
            self.nameLabel.text = hero.name
            self.fullNameLabel.text = hero.biography.fullName.isEmpty ? "Unknown Identity" : hero.biography.fullName
            
            // Характеристики (форматируем текст: "Intelligence: 80")
            self.intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
            self.strengthLabel.text = "Strength: \(hero.powerstats.strength)"
            self.speedLabel.text = "Speed: \(hero.powerstats.speed)"
            self.durabilityLabel.text = "Durability: \(hero.powerstats.durability)"
            self.powerLabel.text = "Power: \(hero.powerstats.power)"
            self.combatLabel.text = "Combat: \(hero.powerstats.combat)"
            
            // Детали
            self.genderLabel.text = "Gender: \(hero.appearance.gender)"
            self.raceLabel.text = "Race: \(hero.appearance.race ?? "Unknown")"
            self.publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")"
            
            // Alignment (раскрасим Good/Bad)
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
