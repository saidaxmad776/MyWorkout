//
//  StaticViewController.swift
//  MyWorkout
//
//  Created by Test on 23/04/22.
//

import UIKit

class StaticViewController: UIViewController {
    
    private let statisticLabel: UILabel = {
        let label = UILabel()
        label.text = "STATISTIC"
        label.font = .robotoMedim24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControll: UISegmentedControl = {
       let segmentedControll = UISegmentedControl(items: ["Week", "Month"])
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.backgroundColor = .specialGreen
        segmentedControll.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentedControll.setTitleTextAttributes([.font : font as Any,
                                                  .foregroundColor : UIColor.white],
                                                 for: .normal)
        segmentedControll.setTitleTextAttributes([.font : font as Any,
                                                  .foregroundColor : UIColor.specialGray],
                                                 for: .selected)
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        segmentedControll.addTarget(self, action: #selector(segmentedChanged), for: .valueChanged)
        return segmentedControll
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let exercisesLabel = UILabel(text: "Exercises")
    
    private let idStatisticTableViewCell = "idStatisticTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setContraints()
        setDelegate()
    }
    
    private func setupView() {
        
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticLabel)
        view.addSubview(segmentedControll)
        view.addSubview(exercisesLabel)
        view.addSubview(tableView)
        tableView.register(StatisticTableViewCell.self, forCellReuseIdentifier: idStatisticTableViewCell)
        
    }
    
    private func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func segmentedChanged() {
        
    }
}

extension StaticViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idStatisticTableViewCell, for: indexPath) as? StatisticTableViewCell else { return UITableViewCell() }
        return cell
    }
}

extension StaticViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}

extension StaticViewController {
    
    private func setContraints() {
        
        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            statisticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControll.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 10),
            segmentedControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
