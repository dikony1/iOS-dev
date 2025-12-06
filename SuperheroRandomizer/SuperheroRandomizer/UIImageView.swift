import UIKit

extension UIImageView {
    func load(url: URL) {
        self.image = nil
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                    self?.alpha = 0
                    UIView.animate(withDuration: 0.5) { self?.alpha = 1 }
                }
            }
        }
    }
}
