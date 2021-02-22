//
//  UnNestableView.swift
//  NestedModal
//
//  Created by Motonari NAKASHIMA on 2021/02/22.
//

import SwiftUI

struct UnNestableView: View {
    
    @State var title = "UnNestableView"
    @State var stack = "UnNestableView"
    
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
                    UnNestableView(stack: "\(stack)->\(selectionName)"),
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
                HStack {
                    Button("isAlertBPresented") {
                        isAlertBPresented = true
                    }
                    Text("not working")
                }
                Button("isActionSheetAPresented") {
                    isActionSheetAPresented = true
                }
                HStack {
                    Button("isActionSheetBPresented") {
                        isActionSheetBPresented = true
                    }
                    Text("not working")
                }
            }
            .padding()
            
            UnNestableChildView()
            
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
        .sheet(isPresented: $isSheetShown, content: {
            NavigationView {
                UnNestableView(stack: "\(stack)->\(selectionName)")
            }
        })
    }
}

struct UnNestableView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UnNestableView()
        }
    }
}
