//
//  ControlToggle.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct ControlToggle: View {
    let label: String?
    @Binding var isOn: Bool

    init(label: String?, isOn: Binding<Bool>) {
        self.label = label
        self._isOn = isOn
    }

    var body: some View {
        Toggle(label ?? "", isOn: $isOn)
            .labelsHidden()
    }
}
