//
//  LearnClosure.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 10/01/25.
//

import SwiftUI

class closureVM: ObservableObject {
    
    @Published var text: String = "Closure Training"
    
    func fetchData() {
//        downloadData3(completionHandler: { returnedData in
//            text = returnedData
//        })
        
        /*// since response is asyncronous use self to handle if user switch between screens scenario
        downloadData4(completionHandler: { [weak self] returnedData in
            self?.text = returnedData
        })*/
        
        /*
         // Using model
        downloadData5(completionHandler: { [weak self] dataVal in
            self?.text = dataVal.data
        })
         */
        // Using typealias
        downloadData6(completionHandler: { [weak self] dataVal in
            self?.text = dataVal.data
        })
    }
    
    // This way is syncronous return
    func downloadData() -> String {
        return "Download Data"
    }
    
    // Basic Closure
    // Closure is adding a function as a parameter into the original function
    func downloadData2(completionHandler: (_ data: String) -> Void ) {
        completionHandler("Basic Closure")
    }
    
    //Same as above void can be used as ()
    func downloadData3(completionHandler: (_ data: String) -> () ) {
        completionHandler("Basic Closure 2")
    }
    
    //Escaping closure since the return data may take time or the return is made asynchronous using this
    func downloadData4(completionHandler: @escaping (_ data: String) -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("Basic Closure 3")
        }
    }
    
    func downloadData5(completionHandler: @escaping (closureResp) -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let resp = closureResp(data: "Basic Closure 4")
            completionHandler(resp)
        }
    }
    
    func downloadData6(completionHandler: @escaping downloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let resp = closureResp(data: "Basic Closure 5")
            completionHandler(resp)
        }
    }
}

typealias downloadCompletion = (closureResp) -> ()

struct closureResp {
    let data: String
}

struct LearnClosure: View {
    
    @StateObject var vm = closureVM()
    
    var body: some View {
        Text(vm.text)
            .foregroundColor(.red)
            .font(.title)
            .onTapGesture {
                vm.fetchData()
            }
    }
}

#Preview {
    LearnClosure()
}
