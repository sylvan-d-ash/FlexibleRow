//
//  ContentView.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("FlexibleRow Variations")

                sectionHeader("Basic Patterns")

                FlexibleRow(title: "Simple Actions") {
                    ControlButton(title: "Edit") {
                        print("Edit tapped")
                    }
                }
                .background(Color(.systemBackground))

                Divider().padding(.leading)

                FlexibleRow(title: "Delete Item") {
                    ControlButton(image: "trash") {
                        print("Delete tapped")
                    }
                }
                .background(Color(.systemBackground))

                Divider().padding(.leading)

                FlexibleRow(title: "Save Changes") {
                    ControlButton(title: "Save", image: "checkmark") {
                        print("save tapped)")
                    }
                }
                .background(Color(.systemBackground))
            }
        }
        .background(Color(.systemGroupedBackground))
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 8)
            .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    ContentView()
}
