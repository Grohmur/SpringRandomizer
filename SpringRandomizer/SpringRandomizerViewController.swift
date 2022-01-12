//
//  ViewController.swift
//  SpringRandomizer
//
//  Created by Михаил Зверьков on 11.01.2022.
//

import Spring
import Darwin

class SpringRandomizerViewController: UIViewController {


    @IBOutlet weak var actionView: SpringView!
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var duretionLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var runButton: UIButton!
    
    private let animationPreset = ["slideLeft", "slideRight", "slideDown",
                                   "slideUp", "squeezeLeft", "squeezeRight",
                                   "squeezeDown", "squeezeUp", "fadeIn",
                                   "fadeOut", "fadeOutIn", "fadeInLeft",
                                   "fadeInRight", "fadeInDown", "fadeInUp",
                                   "zoomIn", "zoomOut", "fall",
                                   "shake", "pop", "flipX",
                                   "flipY", "morph", "squeeze",
                                   "flash", "wobble", "swing"]

   private let animationCurve = ["easeIn", "easeOut", "easeInOut",
                                 "linear", "spring", "easeInSine",
                                 "easeOutSine", "easeInOutSine",
                                 "easeInQuad", "easeOutQuad", "easeInOutQuad",
                                 "easeInCubic", "easeOutCubic", "easeInOutCubic",
                                 "easeInQuart", "easeOutQuart", "easeInOutQuart",
                                 "easeInQuint", "easeOutQuint", "easeInOutQuint",
                                 "easeInExpo", "easeOutExpo", "easeInOutExpo",
                                 "easeInCirc", "easeOutCirc", "easeInOutCirc",
                                 "easeInBack", "easeOutBack", "easeInOutBack"]
    
    private var firstAnimation = true
    private var nextAnimation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionView.layer.cornerRadius = 10
        
        presetLabel.text = "preset:"
        curveLabel.text = "curve:"
        forceLabel.text = "force:"
        duretionLabel.text = "duration:"
        delayLabel.text = "delay:"
        
        runButton.titleLabel?.text = "Run"
    }
    
    @IBAction func runButtonPressed(_ sender: UIButton) {
        if firstAnimation {
            guard let randomAction = animationPreset.randomElement() else { return }
            actionView.animation = randomAction
            presetLabel.text = "preset: \(randomAction)"
            firstAnimation = false
        } else {
            actionView.animation = nextAnimation
            presetLabel.text = "preset: \(nextAnimation)"
        }
        
        guard let newRandomAction = animationPreset.randomElement() else { return }
        nextAnimation = newRandomAction
        runButton.setTitle("Run \(nextAnimation)", for: .normal)

        guard let randomCurve = animationCurve.randomElement() else { return }
        actionView.curve = randomCurve
        curveLabel.text = "curve: \(randomCurve)"
        
        let randomForce = round(Double.random(in: 1...5) * 10) / 10
        actionView.force = randomForce
        forceLabel.text = "force: \(randomForce)"
        
        let randomDuration =  round(Double.random(in: 0.5...3) * 10) / 10
        actionView.duration = randomDuration
        duretionLabel.text = "duration: \(randomDuration)"
        
        let randomDelay = round(Double.random(in: 0...1) * 10) / 10
        actionView.delay = randomDelay
        delayLabel.text = "delay: \(randomDelay)"
        
        actionView.animate()
        }
        
}

