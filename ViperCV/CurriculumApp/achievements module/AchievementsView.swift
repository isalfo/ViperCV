//
//  AchievementsView.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import UIKit

// MARK: AchievementsView class
final class AchievementsView: UIViewController {
    // MARK: - Properties
    @IBOutlet weak private var tableView: UITableView!
    private var achievements: String?
    var presenter: AchievementsPresenterProtocol?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        presenter?.getAchievements()
    }
    // MARK: - Private methods
    private func customizeView() {
        title = NSLocalizedString("AchievementsView_Title_Text", comment: "")
        view.backgroundColor = .systemTeal
    }
}

// MARK: - UITableViewDataSource extension
extension AchievementsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("AchievementsView_AchievementsTableViewCell_Identifier_Text", comment: "")) as? AchievementsTableViewCell
        cell?.achievementsTitle.text = NSLocalizedString("AchievementsView_AchievementsTableViewCell_Title_Text", comment: "")
        cell?.achievementsDescription.text = achievements
        return cell ?? UITableViewCell()
    }
}

// MARK: - AchievementsViewProtocol methods
extension AchievementsView: AchievementsViewProtocol {
    func showAchievements(_ achievements: String) {
        self.achievements = achievements
    }
}
