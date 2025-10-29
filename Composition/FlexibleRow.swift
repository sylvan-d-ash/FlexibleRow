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

extension FlexibleRow where Leading == EmptyView {
    init(center: @escaping () -> Center, trailing: @escaping () -> Trailing) {
        self.leading = { EmptyView() }
        self.center = center
        self.trailing = trailing
    }
}

extension FlexibleRow where Leading == EmptyView, Center == Text {
    init(title: String, trailing: @escaping () -> Trailing) {
        self.leading = { EmptyView() }
        self.center = { Text(title) }
        self.trailing = trailing
    }
}

extension FlexibleRow where Leading == EmptyView, Trailing == EmptyView {
    init(center: @escaping () -> Center) {
        self.leading = { EmptyView() }
        self.center = center
        self.trailing = { EmptyView() }
    }
}
