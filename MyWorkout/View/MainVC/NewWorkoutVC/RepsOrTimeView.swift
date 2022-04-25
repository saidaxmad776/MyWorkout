//
//  RepsOrTimeView.swift
//  MyWorkout
//
//  Created by Test on 24/04/22.
//

import UIKit

class RepsOrTimeView: UIView {
    
    private lazy var setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.maximumTrackTintColor = .specialLigtBrown
        slider.minimumTrackTintColor = .specialGreen
//        slider.setThumbImage(UIImage(named: "sun"), for: .normal)  изменит картинку слайдера
        slider.addTarget(self, action: #selector(setsChangeValueSlider), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.maximumTrackTintColor = .specialLigtBrown
        slider.minimumTrackTintColor = .specialGreen
//        slider.setThumbImage(UIImage(named: "sun"), for: .normal)  изменит картинку слайдера
        slider.addTarget(self, action: #selector(repsChangeValueSlider), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 600
        slider.maximumTrackTintColor = .specialLigtBrown
        slider.minimumTrackTintColor = .specialGreen
//        slider.setThumbImage(UIImage(named: "sun"), for: .normal)  изменит картинку слайдера
        slider.addTarget(self, action: #selector(timerChangeValueSlider), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedim18(), textColor: .specialGray)
    private let numberOfSetLabel = UILabel(text: "0", font: .robotoMedim24(), textColor: .specialGray)
    private let repsLabel = UILabel(text: "Reps", font: .robotoMedim18(), textColor: .specialGray)
    private let numberOfRepsLabel = UILabel(text: "0", font: .robotoMedim24(), textColor: .specialGray)
    private let timerLabel = UILabel(text: "Timer", font: .robotoMedim18(), textColor: .specialGray)
    private let numberOfTimerLabel = UILabel(text: "0 min", font: .robotoMedim24(), textColor: .specialGray)
    
    private let repeatOrTimeLabel = UILabel(text: "Choose repeat or timer")

    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    
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
        
        setsStackView = UIStackView(arrangedSubview: [setsLabel, numberOfSetLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setsSlider)
        addSubview(repeatOrTimeLabel)
        
        repsStackView = UIStackView(arrangedSubview: [repsLabel, numberOfRepsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        
        repsStackView.distribution = .equalSpacing
        addSubview(repsStackView)
        addSubview(repsSlider)
        
        timerStackView = UIStackView(arrangedSubview: [timerLabel, numberOfTimerLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        
        timerStackView.distribution = .equalSpacing
        addSubview(timerStackView)
        addSubview(timerSlider)
        
    }
    
    @objc private func setsChangeValueSlider() {
        numberOfSetLabel.text = "\(Int(setsSlider.value))"
    }
    
    @objc private func repsChangeValueSlider() {
        numberOfRepsLabel.text = "\(Int(repsSlider.value))"
        
        setNegative(label: timerLabel, numberLabel: numberOfTimerLabel, slider: timerSlider)
        setActive(label: repsLabel, numberLabel: numberOfRepsLabel, slider: repsSlider)
    }
    
    @objc private func timerChangeValueSlider() {
        
        let (min, sec) = {(secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60)}(Int(timerSlider.value))
        
        numberOfTimerLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min")
        
        setNegative(label: repsLabel, numberLabel: numberOfRepsLabel, slider: repsSlider)
        setActive(label: timerLabel, numberLabel: numberOfTimerLabel, slider: timerSlider)
    }
    
    private func setNegative(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        numberLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
    
    private func setActive(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        
        label.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
    }
    
    private func getSliderValue() -> (Int, Int, Int) {
        let setsSliderValue = Int(setsSlider.value)
        let repsSliderValur = Int(repsSlider.value)
        let timerSliderValue = Int(timerSlider.value)
        return (setsSliderValue, repsSliderValur, timerSliderValue)
    }
    
    private func refreshWorkoutObjects() {
        numberOfSetLabel.text = "0"
        setsSlider.value = 0
        numberOfRepsLabel.text = "0"
        repsSlider.value = 0
        numberOfTimerLabel.text = "0"
        timerSlider.value = 0
    }
    
    public func refreshLabelAndSlider() {
        refreshWorkoutObjects()
    }
    
    public func setSliderValue() -> (Int, Int, Int) {
        getSliderValue()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatOrTimeLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 15),
            repeatOrTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: repeatOrTimeLabel.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 15),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}

    
    
