//
//  ControlButton.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct ControlButton: View {
    let title: String?
    let image: String?
    let action: () -> Void

    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.image = nil
        self.action = action
    }

    init(image: String, action: @escaping () -> Void) {
        self.title = nil
        self.image = image
        self.action = action
    }

    init(title: String, image: String, action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if let image {
                    Image(systemName: image)
                }
                if let title {
                    Text(title)
                }
            }
        }
    }
}
