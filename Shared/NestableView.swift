//
//  NestableView.swift
//  NestedModal
//
//  Created by Motonari NAKASHIMA on 2021/02/22.
//

import SwiftUI

struct NestableView: View {
    
    @State var title = "NestableView"
    @State var stack = "NestableView"
    
    // present
    @State var isAlertAPresented = false
    @State var isAlertBPresented = false
    @State var isActionSheetAPresented = false
    @State var isActionSheetBPresented = false
    
    // transition
    @State var isNavigationPushed = false
    @State var isSheetShown = false
    
    @State var selectionName = ""
    
    var body: some View {
        VStack {
            NavigationLink(
                destination:
                    NestableView(stack: "\(stack)->\(selectionName)"),
                isActive: $isNavigationPushed,
                label: { EmptyView() }
            )
            
            VStack {
                Text("Hierarchy")
                Text(stack)
            }
            .padding()
            
            VStack(spacing: 16) {
                Text("Modal transition")
                Button("isAlertAPresented") {
                    isAlertAPresented = true
                }
                Button("isAlertBPresented") {
                    isAlertBPresented = true
                }
                Button("isActionSheetAPresented") {
                    isActionSheetAPresented = true
                }
                Button("isActionSheetBPresented") {
                    isActionSheetBPresented = true
                }
            }
            .padding()
            
            NestableChildView()
            
            VStack(spacing: 16) {
                Text("Direct transition")
                Button("isNavigationPushed") {
                    selectionName = "isNavigationPushed"
                    isNavigationPushed = true
                }
                Button("isFullScreenCoverShown") {
                    selectionName = "isFullScreenCoverShown"
                    isSheetShown = true
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .background(
            EmptyView()
                .alert(
                    isPresented: $isAlertAPresented,
                    content: {
                        Alert(
                            title: Text("isAlertAPresented"),
                            primaryButton: .default(
                                Text("Push"),
                                action: {
                                    selectionName = "isAlertAPresented(Push)"
                                    isNavigationPushed = true
                                }
                            ),
                            secondaryButton: .cancel()
                        )
                    }
                )
        )
        .background(
            EmptyView()
                .alert(
                    isPresented: $isAlertBPresented,
                    content: {
                        Alert(
                            title: Text("isAlertBPresented"),
                            primaryButton: .default(
                                Text("Show"),
                                action: {
                                    selectionName = "isAlertBPresented(Show)"
                                    isSheetShown = true
                                }
                            ),
                            secondaryButton: .cancel()
                        )
                    }
                )
        )
        .background(
            EmptyView()
                .actionSheet(
                    isPresented: $isActionSheetAPresented,
                    content: {
                        ActionSheet(
                            title: Text("isActionSheetAPresented"),
                            buttons: [
                                .default(
                                    Text("Push"),
                                    action: {
                                        selectionName = "isActionSheetAPresented(Push)"
                                        isNavigationPushed = true
                                    }
                                ),
                                .default(
                                    Text("Show"),
                                    action: {
                                        selectionName = "isActionSheetAPresented(Show)"
                                        isSheetShown = true
                                    }
                                ),
                                .cancel()
                            ]
                        )
                    }
                )
        )
        .background(
            EmptyView()
                .actionSheet(
                    isPresented: $isActionSheetBPresented,
                    content: {
                        ActionSheet(
                            title: Text("isActionSheetBPresented"),
                            buttons: [
                                .default(
                                    Text("Push"),
                                    action: {
                                        selectionName = "isActionSheetBPresented(Push)"
                                        isNavigationPushed = true
                                    }
                                ),
                                .default(
                                    Text("Show"),
                                    action: {
                                        selectionName = "isActionSheetBPresented(Show)"
                                        isSheetShown = true
                                    }
                                ),
                                .cancel()
                            ]
                        )
                    }
                )
        )
        .sheet(isPresented: $isSheetShown, content: {
            NavigationView {
                NestableView(stack: "\(stack)->\(selectionName)")
            }
        })
    }
}

struct NestableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NestableView()
        }
    }
}
