//
//  NestableChildView.swift
//  NestedModal
//
//  Created by Motonari NAKASHIMA on 2021/02/22.
//

import SwiftUI

struct NestableChildView: View {
    
    // present
    @State var isAlertAPresented = false
    @State var isAlertBPresented = false
    @State var isActionSheetAPresented = false
    @State var isActionSheetBPresented = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Child actions")
            Button("Child AlertAPresented") {
                isAlertAPresented = true
            }
            Button("Child AlertBPresented") {
                isAlertBPresented = true
            }
            Button("Child ActionSheetAPresented") {
                isActionSheetAPresented = true
            }
            Button("Child ActionSheetBPresented") {
                isActionSheetBPresented = true
            }
        }
        .background(
            EmptyView()
                .alert(
                    isPresented: $isAlertAPresented,
                    content: {
                        Alert(
                            title: Text("Child AlertAPresented"),
                            dismissButton: .cancel()
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
                            title: Text("Child AlertBPresented"),
                            dismissButton: .cancel()
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
                            title: Text("Child ActionSheetAPresented"),
                            buttons: [
                                .default(Text("Button")),
                                .default(Text("Button")),
                                .default(Text("Button")),
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
                            title: Text("Child ActionSheetBPresented"),
                            buttons: [
                                .default(Text("Button")),
                                .default(Text("Button")),
                                .default(Text("Button")),
                                .cancel()
                            ]
                        )
                    }
                )
        )
    }
}

struct NestableChildView_Previews: PreviewProvider {
    static var previews: some View {
        NestableChildView()
    }
}
