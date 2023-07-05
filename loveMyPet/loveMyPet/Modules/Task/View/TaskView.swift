//
//  TaskView.swift
//  loveMyPet
//
//  Created by José Winny on 28/06/23.
//

import SwiftUI

struct TaskView: View {
    @State var listOfLetterDay : [String] = TaskViewModel().days
    @State var today : Int = TaskViewModel().today
    var body: some View {
        NavigationView {
            ZStack {
                Color(CustomColor.BackGroundColor)
                    .ignoresSafeArea()
                VStack {
                    Text("Tarefa")
                    InlineCalendar(listOfLetterDay: $listOfLetterDay, selectDay: $today)
                        .frame(height: 84)
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
