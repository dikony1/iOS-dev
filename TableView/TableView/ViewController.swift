//
//  ViewController.swift
//  TableView
//
//  Created by Dinara on 15.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let sections = ["Favorite Movies", "Favorite Music", "Favorite Books", "Favorite Courses"]

    var data: [[FavoriteItem]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()

        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }

    func setupData() {

        let movies = [
            FavoriteItem(imageName: "movie1", title: "The Kissing Booth", subtitle: "The end of an era.", review: "2018 teen romantic comedy"),
            FavoriteItem(imageName: "movie2", title: "Monte Carlo", subtitle: "She's having the time of someone else's life.", review: "Romaic comedy about a young woman who falls in love with a wealthy man."),
            FavoriteItem(imageName: "movie3", title: "1+1", subtitle: "Francois Cluzet and Omar Sy", review: "Un film ecrit et realise par Eric Toledano et Olivier Nakache."),
            FavoriteItem(imageName: "movie4", title: "Divergent", subtitle: "D'apres le bestseller mondial", review: "Cinq destins, un seul choix."),
            FavoriteItem(imageName: "movie5", title: "The Fast and the Furious", subtitle: "Sean Boswell and Dominic Toretto", review: "On the run from a deadly adversary, Dominic Toretto teams up with a young street racer to evade capture.")
        ]

        let music = [
            FavoriteItem(imageName: "music1", title: "The Weeknd", subtitle: "Timless", review: "Many critically acclaimed songs."),
            FavoriteItem(imageName: "music2", title: "Anna of the North", subtitle: "Lovers", review: "Relaxing vibe, emotional tracks."),
            FavoriteItem(imageName: "music3", title: "Heidi Montag", subtitle: "I'll Do It", review: "Girl power anthem."),
            FavoriteItem(imageName: "music4", title: "Adele", subtitle: "Skyfall", review: "Emotional and touching songs."),
            FavoriteItem(imageName: "music5", title: "Lana Del Rey", subtitle: "Salavatore", review: "Beautiful melodies and lyrics.")
        ]

        let books = [
            FavoriteItem(imageName: "book1", title: "Самый богатый человек в Вавилоне", subtitle: "Джордж Клейсон", review: "Главная книга о богатстве."),
            FavoriteItem(imageName: "book2", title: "Миссия выполнима", subtitle: "Маргулан Сейсамбай", review: "Технология счастливой жизни."),
            FavoriteItem(imageName: "book3", title: "Тонкое искусство пофигизма", subtitle: "Марк Мэнсон", review: "Парадоксальной способ жить счастливо."),
            FavoriteItem(imageName: "book4", title: "Atomic Habits", subtitle: "James Clear", review: "Practical self-improvement guide."),
            FavoriteItem(imageName: "book5", title: "Все книги Агата Кристи", subtitle: "Агата Кристи", review: "Детективные романы.")
        ]

        let courses = [
            FavoriteItem(imageName: "course1", title: "iOS Development", subtitle: "Mobile Dev", review: "Love building apps!"),
            FavoriteItem(imageName: "course2", title: "Cybersecurity", subtitle: "IT Dept", review: "Important and interesting."),
            FavoriteItem(imageName: "course3", title: "Web Development", subtitle: "Mobile Dev", review: "Important and interesting."),
            FavoriteItem(imageName: "course4", title: "Financial Literacy", subtitle: "Skillium", review: "Useful for everyone."),
            FavoriteItem(imageName: "course5", title: "Ui/Ux design", subtitle: "IT Dept", review: "Helps understand how systems communicate with users.")
        ]

        data = [movies, music, books, courses]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell

        let item = data[indexPath.section][indexPath.row]

        cell.itemImageView.image = UIImage(named: item.imageName)
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.subtitle
        cell.reviewLabel.text = item.review

        return cell
    }

}



