//
//  ContentView.swift
//  SwiftUIMarkdown
//
//  Created by D. Prameswara on 24/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "**SwiftUI** helps you build great-looking apps across all _Apple_ platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.[SwiftUI](https://developer.apple.com/xcode/swiftui/)"
    // declare variable as LocalizeStringKey instead
    @State private var localizeText: LocalizedStringKey = "**SwiftUI** helps you build great-looking apps across all _Apple_ platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.[SwiftUI](https://developer.apple.com/xcode/swiftui/)"
    
    
    private var attrText: AttributedString {
        do {
            var text = try AttributedString(
                markdown: "**SwiftUI** helps you build great-looking apps across all _[Apple](https://apple.com)_ platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any ~Apple device~, using just one set of tools and APIs."
            )

            if let range = text.range(of: "SwiftUI") {
                text[range].backgroundColor = .yellow
                text[range].foregroundColor = .red
            }

            if let range = text.range(of: "Apple") {
                text[range].foregroundColor = .purple
                text[range].font = .system(size: 30)
            }
            if let range = text.range(of: "Apple device") {
                text[range].backgroundColor = .red
                text[range].foregroundColor = .white
                text[range].font = .boldSystemFont(ofSize: 25)
            }

            return text
        } catch {
            return "Error text attribute"
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("This is just regular Text")
                Text("This with **Bold** style")
                Text("This with *Italic* style")
                Text("This one with ~Strikethrough~ style")
                Text("This one with `Monopace`")
                Text("This one with [Goto Google](www.google.com) Link")
            }
            VStack {
                // convert String to LocalizedStringKey first
                Text(LocalizedStringKey(text))
                Divider()
                Text(localizeText)
                    .tint(.pink)
            }

            Text(attrText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
