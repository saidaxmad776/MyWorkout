//
//  CallendarCollectionViewCell.swift
//  MyWorkout
//
//  Created by Test on 22/04/22.
//

import UIKit

class CallendarCollectionViewCell: UICollectionViewCell {
    
    let dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.font = .robotoBold16()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfDaykLabel: UILabel = {
        let label = UILabel()
        label.text = "07"
        label.font = .robotoBold20()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                dayOfWeekLabel.textColor = .specialBlack
                numberOfDaykLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDaykLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDaykLabel)
    }
    
    private func cellConfigure(numberOfDay: String, dayOfWeek: String) {
        numberOfDaykLabel.text = numberOfDay
        dayOfWeekLabel.text = dayOfWeek
    }
    
    public func dateForCell(numberOfDay: String, dayOfWeek: String) {
        cellConfigure(numberOfDay: numberOfDay, dayOfWeek: dayOfWeek)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            numberOfDaykLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDaykLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
