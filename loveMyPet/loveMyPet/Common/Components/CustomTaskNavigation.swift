//
//  CustomTaskNavigation.swift
//  loveMyPet
//
//  Created by José Winny on 03/07/23.
//

import SwiftUI

struct CustomTaskNavigation <TaskView: View, AddTask: View> : View {
    @ViewBuilder let taskListView: TaskView
    @ViewBuilder let addTaskView: AddTask
    @State private var showingPopover = false
    var update: () -> Void
    
    var body: some View {
        NavigationView{
            taskListView
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(Assets.Image.namedLogo)
                            .padding(.horizontal)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(Assets.Icon.add)
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(Assets.Icon.calendar)
                            .padding(.horizontal)
                    }
                }
        }
        .sheet(isPresented: $showingPopover, onDismiss: { update() }) {
            NavigationView{
                addTaskView
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button {
                                showingPopover = false
                            } label: {
                                Text(Constants.Home.cancel)
                                    .foregroundColor(Color(CustomColor.MainColor))
                                    .font(.custom(Font.Regular, size: 16))
                            }
                        })
                    }
            }
        }
    }
}
