//
//  DateAndRepeatView.swift
//  MyWorkout
//
//  Created by Test on 24/04/22.
//

import UIKit


class DateAndRepeatView: UIView {
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatSwitch: UISwitch = {
        let testSwitch = UISwitch()
        testSwitch.isOn = true
        testSwitch.onTintColor = .specialGreen
        testSwitch.translatesAutoresizingMaskIntoConstraints = false
        return testSwitch
    }()
    
    private let dateLabel = UILabel(text: "Date",
                                    font: .robotoMedim18(),
                                    textColor: .specialGray)
    
    private let repeatLabel = UILabel(text: "Repeat every 7 days",
                                      font: .robotoMedim18(),
                                      textColor: .specialGray)
    
    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        dateStackView = UIStackView(arrangedSubview: [dateLabel, datePicker],
                                    axis: .horizontal, spacing: 10)
        addSubview(dateStackView)
        
        repeatStackView = UIStackView(arrangedSubview: [repeatLabel, repeatSwitch],
                                      axis: .horizontal, spacing: 10)
        addSubview(repeatStackView)
    }
    
    private func getDateAndRepeat() -> (Date, Bool) {
        (datePicker.date, repeatSwitch.isOn)
    }
    
    private func refreshWorkoutObjects() {
        datePicker.setDate(Date(), animated: true)
        repeatSwitch.isOn = true
    }
    
    public func refreshDatePickerAndSwitch() {
        refreshWorkoutObjects()
    }
    
    public func setDateAndRepeat() -> (Date, Bool) {
        getDateAndRepeat()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
