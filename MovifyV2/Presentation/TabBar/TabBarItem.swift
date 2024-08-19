import SwiftUI

struct TabbarItem: View {
    var name: String
    var isActive: Bool = false
    let namespace: Namespace.ID
    
    var body: some View {
        if isActive {
            Text(name)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(.white)
                .background(Capsule().foregroundColor(.blue))
                .matchedGeometryEffect(id: "highlightmenuitem", in: namespace)
        } else {
            Text(name)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(.black)
        }
        
    }
}
