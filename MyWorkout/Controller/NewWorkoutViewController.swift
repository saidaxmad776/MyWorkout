//
//  NewWorkoutViewController.swift
//  MyWorkout
//
//  Created by Test on 23/04/22.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedim24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.backgroundColor = .specialGreen
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameLabel = UILabel(text: "Name")
    private let dateLabel = UILabel(text: "Date and Repeat")
    private let repsOrTimeLabel = UILabel(text: "Reps or time")
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimeView = RepsOrTimeView()
    
    private var workoutModel = WorkoutModel()
    
    private let testImage = UIImage(named: "testWorkaut")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setContraints()
        setDelegate()
        addTaps()
    }
    
    private func setupView() {
       
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        
        view.addSubview(dateLabel)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimeLabel)
        view.addSubview(repsOrTimeView)
        
        view.addSubview(saveButton)
    }
    
    private func setDelegate() {
        nameTextField.delegate = self
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
    private func setModel() {
        guard let nameWorkout = nameTextField.text else { return }
        workoutModel.workoutName = nameWorkout
        
        let dateFromPicker = dateAndRepeatView.setDateAndRepeat().0
        workoutModel.workoutDate = dateFromPicker
        workoutModel.workoutNumberOfDay = dateFromPicker.getWeekdayNumber()
        
        workoutModel.workoutRepeat = dateAndRepeatView.setDateAndRepeat().1
        
        workoutModel.workoutSets = repsOrTimeView.setSliderValue().0
        workoutModel.workoutReps = repsOrTimeView.setSliderValue().1
        workoutModel.workoutTimer = repsOrTimeView.setSliderValue().2

        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workkoutImage = imageData
    }
    
    private func saveModel() {
        guard let text = nameTextField.text else { return }
        let count = text.filter { $0.isNumber || $0.isLetter }.count
        
        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(model: workoutModel)
            workoutModel = WorkoutModel()
            alertOk(title: "Success", message: nil)
            refreshObjects()
        } else {
            alertOk(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func refreshObjects() {
        dateAndRepeatView.refreshDatePickerAndSwitch()
        repsOrTimeView.refreshLabelAndSlider()
        nameTextField.text = ""
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipehideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func swipehideKeyboard() {
        view.endEditing(true)
    }
}

//        MARK: - UITextFieldDelegate

extension NewWorkoutViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
    }
    
}

extension NewWorkoutViewController {
    
    private func setContraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 93)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimeLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            repsOrTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimeView.topAnchor.constraint(equalTo: repsOrTimeLabel.bottomAnchor, constant: 0),
            repsOrTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimeView.heightAnchor.constraint(equalToConstant: 330)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimeView.bottomAnchor,constant: 25),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
    }
}
