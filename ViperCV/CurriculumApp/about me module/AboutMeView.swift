//
//  AboutMeView.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import UIKit

// MARK: AboutMeView class
final class AboutMeView: UIViewController {
    // MARK: - Properties
    @IBOutlet weak private var tableView: UITableView!
    var presenter: AboutMePresenterProtocol?
    var aboutMeInfo: About?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        presenter?.getAboutMeInfo()
    }
    
    // MARK: - Private Methods
    private func customizeView() {
        title = NSLocalizedString("AboutMeView_Title_Text", comment: "")
        view.backgroundColor = .systemTeal
    }
}

// MARK: - UITableViewDataSource extension
extension AboutMeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("AboutMeView_AboutMeTableViewCell_Identifier_Text", comment: ""), for: indexPath) as? AboutTableViewCell
                cell?.cellTitle.text = NSLocalizedString("AboutMeView_AboutMeTableViewCell_Title_Text", comment: "")
                cell?.cellDescription.text = aboutMeInfo?.summary
                
                return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("AboutMeView_AboutMeTableViewCell_Identifier_Text", comment: ""), for: indexPath) as? AboutTableViewCell
                cell?.cellTitle.text = NSLocalizedString("AboutMeView_HobbiesTableViewCell_Title_Text", comment: "")
                cell?.cellDescription.text = aboutMeInfo?.hobbies
                return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("AboutMeView_AboutMeTableViewCell_Identifier_Text", comment: ""), for: indexPath) as? AboutTableViewCell
                cell?.cellDescription.text = aboutMeInfo?.skills.joined(separator: "\n")
                cell?.cellTitle.text = NSLocalizedString("AboutMeView_SkillsTableViewCell_Title_Text", comment: "")
                return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - AboutMeProtocol methods
extension AboutMeView: AboutMeViewProtocol {
    func showContactInfo(_ info: AboutModel) {
        self.aboutMeInfo = info.about
    }
}
