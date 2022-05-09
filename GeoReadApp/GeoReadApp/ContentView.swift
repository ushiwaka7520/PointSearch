//
//  ContentView.swift
//  GeoReadApp
//
//  Created by cmStudent on 2022/04/26.
//

import SwiftUI

class ViewModel: ObservableObject{
    @Published var btnXs:Int = 0
    @Published var btnXe:Int = 0
    @Published var btnYs:Int = 0
    @Published var btnYe:Int = 0
}

struct ContentView: View {
        @ObservedObject var vm = ViewModel()
//    @State var btnX:String
//    @State var btnY:String

    var body: some View {
            VStack{
                Spacer()
                Text("座標の表示")
                    .font(.title)
                    .padding()
                Text("X：\(vm.btnXs), \(vm.btnXe)")
                    .font(.title2)
                Text("Y：\(vm.btnYs), \(vm.btnYe)")
                    .font(.title2)
                Spacer()
                //縦
                ForEach(1..<9){_ in
                    HStack{
                        Spacer()
                        //横
                        ForEach(1..<4){ num in
                            GeometryReader{ geometry in
                            Button(action: {
                                //btnAction
                                vm.btnXs = Int(geometry.frame(in: .global).minX)
                                vm.btnXe = Int(geometry.frame(in: .global).maxX)
                                vm.btnYs = Int(geometry.frame(in: .global).minY)
                                vm.btnYe = Int(geometry.frame(in: .global).maxY)
                            }) {
                                Text("　　　　")
                                    .padding()
                                    .border(Color.black)
                                    .background(Color.blue)
                            }//Button(View)
                        }//GeometryReader
                    }//ForEach(1-4)
                }//HStack
            }//ForEach(1-9)
        }//VStack
    }//body
}//View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
