//
//  finalProjectV1App.swift
//  finalProjectV1
//
//  Created by Lwj on 2021/11/21.
//

import SwiftUI

@main
struct finalProjectV1App: App {
    
//    @StateObject var vm = ckLgIn()
    
    var body: some Scene {
        WindowGroup {
//            if vm.isLogin {
//                LoginView().environmentObject(vm)
//                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4)))
//            } else {
//                HomeView().environmentObject(vm)
//                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.4)))
//            }
            LoginView()
        }
    }
}
