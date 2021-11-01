//
//  SystemMessagesList.swift
//  Topchik
//
//  Created by Andrey Sinyagin on 26.03.2021.
//

import SwiftUI

struct SystemMessagesList: View {
    var messages: [String]
    
    var body: some View {
        List(messages, id: \.self) {
            Text("\($0)")
        }
    }
}

struct SystemMessagesList_Previews: PreviewProvider {
    static var previews: some View {
        SystemMessagesList(messages: ["preview provider test"])
    }
}
