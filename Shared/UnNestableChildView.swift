//
//  UnNestableChildView.swift
//  NestedModal
//
//  Created by Motonari NAKASHIMA on 2021/02/22.
//

import SwiftUI

struct UnNestableChildView: View {
    
    // present
    @State var isAlertAPresented = false
    @State var isAlertBPresented = false
    @State var isActionSheetAPresented = false
    @State var isActionSheetBPresented = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Child actions")
            HStack {
                Button("Child AlertAPresented") {
                    isAlertAPresented = true
                }
                Text("not working")
            }
            HStack {
                Button("Child AlertBPresented") {
                    isAlertBPresented = true
                }
                Text("not working")
            }
            HStack {
                Button("Child ActionSheetAPresented") {
                    isActionSheetAPresented = true
                }
                Text("not working")
            }
            HStack {
                Button("Child ActionSheetBPresented") {
                    isActionSheetBPresented = true
                }
                Text("not working")
            }
        }
        .alert(
            isPresented: $isAlertAPresented,
            content: {
                Alert(
                    title: Text("Child AlertAPresented"),
                    dismissButton: .cancel()
                )
            }
        )
        .alert(
            isPresented: $isAlertBPresented,
            content: {
                Alert(
                    title: Text("Child AlertBPresented"),
                    dismissButton: .cancel()
                )
            }
        )
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
    }
}

struct UnNestableChildView_Previews: PreviewProvider {
    static var previews: some View {
        UnNestableChildView()
    }
}
