//
//  MeView.swift
//  finalProjectV1
//
//  Created by Lwj on 2021/11/26.
//

import SwiftUI

struct MeView: View {
    
//    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        ChangeInfoView()
//                            .onAppear { self.tabBar.isHidden = true }
//                            .onDisappear { self.tabBar.isHidden = false }
                    } label: {
                        Image(systemName: "person")
                        Text("alex")
                    }
                }
                
                Section {
                    NavigationLink {
                        SettingView()
                    } label: {
                        Text("Settings")
                    }
                }
                Section {
                    NavigationLink(destination: LoginView().navigationBarHidden(true)) {
                        Button {
                        } label: {
                            Text("log out")
                        }

                    }
                }
            }
            .navigationBarTitle("About Me!", displayMode: .inline)
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
