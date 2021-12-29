//
//  MainPageView.swift
//  finalProjectV1
//
//  Created by Lwj on 2021/11/26.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationView{
            Text("main page!")
                .navigationBarHidden(true)
        }
            
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
