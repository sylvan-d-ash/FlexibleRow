//
//  FlexibleRow.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct FlexibleRow<Leading: View, Center: View, Trailing: View>: View {
    @ViewBuilder let leading: () -> Leading
    @ViewBuilder let center: () -> Center
    @ViewBuilder let trailing: () -> Trailing

    var body: some View {
        HStack {
            leading()
            center()
            Spacer()
            trailing()
        }
        .padding()
    }
}
