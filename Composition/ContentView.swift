//
//  ContentView.swift
//  Composition
//
//  Created by Sylvan  on 29/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var hasNotifications = true
    @State private var isDarkMode = true
    @State private var sortOrder = 0
    @State private var isFavourite = false

    var body: some View {
        NavigationView {
            List {
                Section("Basic Patterns") {
                    FlexibleRow(title: "Simple Actions") {
                        ControlButton(title: "Edit") {
                            print("Edit tapped")
                        }
                    }

                    FlexibleRow(title: "Delete Item") {
                        ControlButton(image: "trash") {
                            print("Delete tapped")
                        }
                    }

                    FlexibleRow(title: "Save Changes") {
                        ControlButton(title: "Save", image: "checkmark") {
                            print("save tapped)")
                        }
                    }
                }

                Section("Toggle Controls") {
                    FlexibleRow(title: "Notifications") {
                        ControlToggle(isOn: $hasNotifications)
                    }

                    FlexibleRow(title: "Dark Mode") {
                        ControlToggle(label: "Dark Mode", isOn: $isDarkMode)
                    }
                }

                Section("Sort Options") {
                    FlexibleRow(title: "Name") {
                        ControlRadio(isSelected: sortOrder == 0) {
                            sortOrder = 0
                        }
                    }

                    FlexibleRow(title: "Date") {
                        ControlRadio(isSelected: sortOrder == 1) {
                            sortOrder = 1
                        }
                    }

                    FlexibleRow(title: "Size") {
                        ControlRadio(isSelected: sortOrder == 2) {
                            sortOrder = 2
                        }
                    }
                }

                Section("Navigation Patterns") {
                    FlexibleRow {
                        ControlButton(image: "chevron.left") {
                            print("back")
                        }
                    } center: {
                        Text("Chapter 5")
                            .font(.headline)
                    } trailing: {
                        ControlButton(image: "chevron.right") {
                            print("forward")
                        }
                    }

                    FlexibleRow {
                        ControlRadio(
                            selectedImage: "heart.fill",
                            unselectedImage: "heart",
                            selectedColor: .red,
                            unselectedColor: .red,
                            isSelected: isFavourite
                        ) {
                            isFavourite.toggle()
                        }
                    } center: {
                        Text("Favourite Item")
                    } trailing: {
                        ControlButton(image: "square.and.arrow.up") {
                            print("share")
                        }
                    }
                }

                Section("Mixed Controls") {
                    FlexibleRow {
                        ControlRadio(isSelected: true) {
                            print("theme selected")
                        }
                    } center: {
                        Text("Light Theme")
                    } trailing: {
                        ControlToggle(isOn: .constant(true))
                    }

                    FlexibleRow {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    } center: {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Premium Feature")
                                .font(.system(size: 16, weight: .semibold))
                            Text("Unlock all features")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    } trailing: {
                        ControlButton(title: "Upgrade") {
                            print("upgrade tapped")
                        }
                    }
                }

                Section("Complex Layouts") {
                    FlexibleRow {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.blue)
                    } center: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("John Doe")
                                .font(.headline)
                            Text("john.doe@example.com")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text("Premium Member")
                                .font(.caption)
                                .foregroundStyle(.blue)
                        }
                    } trailing: {
                        VStack(spacing: 8) {
                            ControlButton(image: "pencil") {
                                print("edit profile")
                            }
                            ControlButton(image: "gearshape") {
                                print("settings")
                            }
                        }
                    }

                    FlexibleRow(title: "Manage Item") {
                        HStack(spacing: 12) {
                            ControlButton(image: "pencil") {
                                print("edit")
                            }
                            ControlButton(image: "doc.on.doc") {
                                print("duplicate")
                            }
                            ControlButton(image: "trash") {
                                print("delete")
                            }
                        }
                    }
                }

                Section("Center Only") {
                    FlexibleRow {
                        Text("No controls, Just Content")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("FlexibleRow Variations")
            .listStyle(.grouped)
        }
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
