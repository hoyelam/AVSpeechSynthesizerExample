//
//  SpeechSynthesizer.swift
//  AVSpeechSynthesizerExample
//
//  Created by Hoye Lam on 27/08/2022.
//

import Foundation
import AVFoundation
import NaturalLanguage

protocol SpeechSynthesizerProviding {
    var synthesizer: AVSpeechSynthesizer { get }
    func speakText(_ text: String)
}

final class SpeechSynthesizer: SpeechSynthesizerProviding {
    var synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    func speakText(_ text: String) {
        synthesizer.stopSpeaking(at: .immediate)
        
        let utterance = AVSpeechUtterance(string: text)
        
        if let language = self.detectLanguageOf(text: text) {
            utterance.voice = AVSpeechSynthesisVoice(language: language.rawValue)
        }
        
        synthesizer.speak(utterance)
    }
    
    private func detectLanguageOf(text: String) -> NLLanguage? {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        
        guard let language = recognizer.dominantLanguage else {
            return nil
        }
        
        return language
    }
}
