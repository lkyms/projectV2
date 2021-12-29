//
//  RegisterView.swift
//  finalProjectV1
//
//  Created by Lwj on 2021/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: ckLgIn
    
    var body: some View {
        NavigationView{
            TabView {
                    MainPageView()
                        .tabItem {
                            Image(systemName: "house")
                                .padding()
                            Text("Home")
                                .font(.title)
                        }
    //                    .navigationBarHidden(true)
                    MessageVIew()
                        .tabItem {
                            Image(systemName: "message")
                                .padding()
                            Text("Message")
                                .font(.title)
                        }
    //                    .navigationBarHidden(true)
                    BoardView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                                .padding()
                            Text("Board")
                                .font(.title)
                        }
    //                    .navigationBarHidden(true)
                    MeView()
                        .tabItem {
                            Image(systemName: "person")
                                .padding()
                            Text("Me")
                                .font(.title)
                        }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
