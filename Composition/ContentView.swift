//
//  ContentView.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FlexibleRow(
            title: "Winter",
            trailing: { Button("Tap me") {} }
        )

        FlexibleRow(
            center: { Image(systemName: "globe") },
            trailing: { Text("Winter is coming") }
        )

        FlexibleRow(
            leading: { Button(action: {}, label: { Image(systemName: "globe") }) },
            center: { Text("Hello") },
            trailing: { Button("Tap me too") {} }
        )
    }
}

#Preview {
    ContentView()
}
