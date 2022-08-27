//
//  ContentView.swift
//  AVSpeechSynthesizerExample
//
//  Created by Hoye Lam on 27/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(
        speechSynthesizer: SpeechSynthesizer()
    )
    
    var body: some View {
        VStack {
            TextField(
                "Type the text you want to hear",
                text: $viewModel.text
            )
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(16)
            
            Button {
                viewModel.onTapSpeak()
            } label: {
                Label(
                    "Speak it!",
                    systemImage: "text.bubble"
                )
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(16)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
