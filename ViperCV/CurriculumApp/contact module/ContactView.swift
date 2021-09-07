//
//  ContactView.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 24/08/2021.
//

import UIKit

// MARK: ContactView class
final class ContactView: UIViewController {
    // MARK: - Properties
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var location: UILabel!
    @IBOutlet weak private var email: UILabel!
    @IBOutlet weak private var area: UILabel!
    @IBOutlet weak private var photo: UIImageView!
    @IBOutlet weak private var careerButton: UIButton!
    @IBOutlet weak private var aboutMeButton: UIButton!
    @IBOutlet weak private var achievementsButton: UIButton!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    private var viewContact: Contact?
    var presenter: ContactPresenterProtocol?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
            super.viewDidLoad()
            activityIndicator.startAnimating()
            customizeView()
            presenter?.getContact()
        }
    
    // MARK: - Private methods
    private func customizeView() {
        title = NSLocalizedString("ContactView_Title_Text", comment: "")
        navigationController?.navigationBar.barTintColor = .systemTeal
    }
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        guard let contact = viewContact else { return }
        switch sender {
        case careerButton:
            goToPresenter(for: NSLocalizedString("ContactView_CareerButtonPressed_Text", comment: ""), with: contact)
        case aboutMeButton:
            goToPresenter(for: NSLocalizedString("ContactView_AboutButtonPressed_Text", comment: ""), with: contact)
        case achievementsButton:
            goToPresenter(for: NSLocalizedString("ContactView_AchievementsButtonPressed_Text", comment: ""), with: contact)
        default:
            presenter?.sendError("")
        }
    }
    
    @objc private func refresh(sender : UIButton) {
        presenter?.getContact()
    }   
}

// MARK: - ContactViewProtocol extension
extension ContactView: ContactViewProtocol {
    func getViewContact(_ contact: Contact) {
        self.viewContact = contact
        DispatchQueue.main.async {
            self.name.text = contact.basics.name
            self.location.text = "\(contact.basics.location.country) - \(contact.basics.location.city)"
            self.email.text = contact.basics.email
            self.area.text = contact.basics.label
            if let url = URL(string: contact.basics.image){
                self.photo.load(url: url)
                self.photo.layer.cornerRadius = self.photo.frame.width/2
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func goToPresenter(for sender: String, with contact: Contact) {
        presenter?.askForView(for: sender, with: contact)
    }
    
    func hideLabels() {
        self.name.isHidden = true
        self.location.isHidden = true
        self.area.isHidden = true
        self.photo.isHidden = true
        self.email.isHidden = true
        self.careerButton.isHidden = true
        self.aboutMeButton.isHidden = true
        self.achievementsButton.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    func createErrorLabels() {
        // Labels declaration
        let nothingToShowLabel: UILabel = UILabel()
        let refreshButton: UIButton = UIButton()
        
        // Labels attributes
        nothingToShowLabel.translatesAutoresizingMaskIntoConstraints = false
        nothingToShowLabel.text = NSLocalizedString("ContactView_Error_Label_Text", comment: "")
        nothingToShowLabel.font = UIFont.systemFont(ofSize: 36)
        nothingToShowLabel.textAlignment  = .center
        nothingToShowLabel.adjustsFontSizeToFitWidth = true
        refreshButton.setTitleColor(UIColor.red, for: .normal)
        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.titleLabel?.adjustsFontSizeToFitWidth = true
        refreshButton.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        
        self.view.addSubview(nothingToShowLabel)
        self.view.addSubview(refreshButton)
        
        // Labels constraints
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        nothingToShowLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nothingToShowLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        nothingToShowLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.trailingAnchor, constant: 20).isActive = true
        nothingToShowLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 20).isActive = true
        refreshButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        refreshButton.topAnchor.constraint(equalTo: nothingToShowLabel.bottomAnchor, constant: 100).isActive = true
    }
}
