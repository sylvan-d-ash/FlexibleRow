//
//  ControlRadio.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct ControlRadio: View {
    var selectedImage = "circle.inset.filled"
    var unselectedImage = "circle"
    var selectedColor = Color.blue
    var unselectedColor = Color.gray
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isSelected ? selectedImage : unselectedImage)
                .foregroundStyle(isSelected ? selectedColor : unselectedColor)
        }
    }
}
