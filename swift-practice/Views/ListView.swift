//
//  ListView.swift
//  swiftPractice
//
//  Created by suyeon on 8/7/24.
//

import SwiftUI

struct ListView: View {
    @State private var names: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false

       var body: some View {
           VStack {
               VStack(spacing: 8) {
                    Image(systemName: "person.3.sequence.fill")
                        .symbolRenderingMode(.hierarchical)
                   Text("리스트")
                }
                .font(.title3)
                .padding()
               
               HStack{
                   Text(pickedName.isEmpty ? " " : pickedName)
               }


               List {
                   ForEach(names, id: \.self) { name in
                       Text(name)
                   }
               }.listStyle(PlainListStyle())

               
               TextField("Add Name", text: $nameToAdd)
                   .autocorrectionDisabled()
                   .onSubmit {
                       if !nameToAdd.isEmpty {
                           names.append(nameToAdd)
                           nameToAdd = ""
                       }
                   }
                   .padding()
               
               Divider()
               
               Toggle("선택 이름 지우기", isOn: $shouldRemovePickedName)

               Button("이름 랜덤 선택") {
                   if let randomName = names.randomElement() {
                       pickedName = randomName
                       
                       if shouldRemovePickedName {
                           names.removeAll { name in
                             return (name == randomName)
                           }
                       }
                   } else {
                       pickedName = ""
                   }
               }.padding()
           }
           .padding()
       }
}

#Preview {
    ListView()
}
