//
//  Conductor.swift
//  ExtendingAudioKit
//
//  Created by Shane Dunne, revision history on Githbub.
//  Copyright © 2018 AudioKit. All rights reserved.
//

import AudioKit

class Conductor {
    
    static let shared = Conductor()
    
    var oscillator1 = AKOscillator()
    var oscillator2 = AKOscillator()
    var mixer = AKMixer()
    var oscillatorGain: JBBooster    // Your own extension AKNode!
    
    init() {
        
        mixer = AKMixer(oscillator1, oscillator2)

        
        // Cut the volume in half since we have two oscillators
        mixer.volume = 0.5
        oscillatorGain = JBBooster(mixer)
        AudioKit.output = oscillatorGain
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start")
        }
        
        oscillatorGain.gain = 0.1

    }
    
    func toggleSound() {
        if oscillator1.isPlaying {
            oscillator1.stop()
            oscillator2.stop()
   
        } else {
            oscillator1.amplitude = random(in: 0.5 ... 1)
            oscillator1.frequency = random(in: 220 ... 880)
            oscillator1.start()
            oscillator2.amplitude = random(in: 0.5 ... 1)
            oscillator2.frequency = random(in: 220 ... 880)
            oscillator2.start()

        }
    }
    
    func setGain(_ value: Double){
        oscillatorGain.gain = value
    }
    
}
