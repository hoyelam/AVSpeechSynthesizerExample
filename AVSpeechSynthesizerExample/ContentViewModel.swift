//
//  ContentViewModel.swift
//  AVSpeechSynthesizerExample
//
//  Created by Hoye Lam on 27/08/2022.
//

import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var text: String = "Speak to me please"
    
    let speechSynthesizer: SpeechSynthesizerProviding
    
    init(speechSynthesizer: SpeechSynthesizerProviding) {
        self.speechSynthesizer = speechSynthesizer
    }
    
    func onTapSpeak() {
        speechSynthesizer.speakText(self.text)
    }
}
