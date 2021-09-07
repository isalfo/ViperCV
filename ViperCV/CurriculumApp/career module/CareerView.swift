//
//  CareerView.swift
//  CurriculumApp
//
//  Created by Gonzalo Alfonso on 25/08/2021.
//

import UIKit

// MARK: CareerView class
final class CareerView: UIViewController {
    // MARK: - Properties
    @IBOutlet weak private var careerTableView: UITableView!
    var presenter: CareerPresenterProtocol?
    var jobExperience: [Work]?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        presenter?.getJobs()
        
    }
    
    // MARK: - Private methods
    private func customizeView() {
        title = NSLocalizedString("CareerView_Title_Text", comment: "")
        view.backgroundColor = .systemTeal
    }
}

// MARK: - UITableViewDataSource extension
extension CareerView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobExperience?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("CareerView_TableViewCell_Identifier_Text", comment: "")) as? CareerTableViewCell
        cell?.accessoryType = .detailButton
        let jobs: Work = jobExperience?[indexPath.row] ?? Work(summary: "", company: "", position: "", startDate: "", endDate: "")
        cell?.companyLabel.text = jobs.company
        cell?.dateLabel.text = NSLocalizedString("CareerView_TableView_DateLabel_Since_Text", comment: "") + jobs.startDate + NSLocalizedString("CareerView_TableView_DateLabel_Until_Text", comment: "") + jobs.endDate
        cell?.positionLabel.text = jobs.position
        cell?.summaryLabel.text = jobs.summary
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate extension
extension CareerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        presenter?.companyDetail(presenter?.companies[indexPath.row] ?? "")
        
    }
}

// MARK: - CareerViewProtocol methods
extension CareerView: CareerViewProtocol {
    func showJobs(_ jobs: [Work]) {
        self.jobExperience = jobs
    }
}
