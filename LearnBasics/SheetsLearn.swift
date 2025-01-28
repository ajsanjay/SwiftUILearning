//
//  SheetsLearn.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 27/01/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let titel: String
}

/*In this code if selecting button 1 it will display Initial title since the sheet will first present the ui and then will update the selected model so that the solution is in the following*/
    /*struct SheetsLearn: View {
    
    @State var selectedModel: RandomModel = RandomModel(titel: "Initial title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomModel(titel: "Selected 1")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedModel = RandomModel(titel: "Selected 2")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            SheetScrren(selectedModel: selectedModel)
        })
    }
}

struct SheetScrren: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.titel)
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
    
}*/

//Possible Solutions
/*
 1 - Binding
 2 - Use multiple .sheets
 3 - Use $item approach
 */

//This Eg is using Binding
/*struct SheetsLearn: View {
    
    @State var selectedModel: RandomModel = RandomModel(titel: "Initial title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomModel(titel: "Selected 1")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedModel = RandomModel(titel: "Selected 2")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            SheetScrren(selectedModel: $selectedModel)
        })
    }
}

struct SheetScrren: View {
    
    @Binding var selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.titel)
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
    
} */

//This Eg is using multiple .sheets
/*struct SheetsLearn: View {
    
    @State var selectedModel: RandomModel = RandomModel(titel: "Initial title")
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                showSheet1.toggle()
            }
            .sheet(isPresented: $showSheet1, content: {
                SheetScrren(selectedModel: RandomModel(titel: "Selected 1"))
            })
            Button("Button 2") {
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                SheetScrren(selectedModel: RandomModel(titel: "Selected 2"))
            })
        }
    }
}

struct SheetScrren: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.titel)
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
    
}*/

//This Eg is using $item approach
struct SheetsLearn: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        VStack (spacing: 20) {
            ForEach(0..<20) { index in
                Button("Button \(index)") {
                    selectedModel = RandomModel(titel: "Selected \(index)")
                }
            }
        }
        .sheet(item: $selectedModel) { model in
            SheetScrren(selectedModel: model)
        }
    }
}

struct SheetScrren: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.titel)
            .font(.largeTitle)
            .fontWeight(.bold
            )
    }
    
}
#Preview {
    SheetsLearn()
}
