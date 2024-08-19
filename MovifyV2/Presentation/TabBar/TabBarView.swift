import SwiftUI

struct TabBarView: View {
    var tabItems: [String]
    @Binding var selectedIndex: Int
    @Namespace private var menuItemTransition
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabItems.indices, id: \.self) { index in
                        TabbarItem(name: tabItems[index], isActive: selectedIndex == index, namespace: menuItemTransition)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                            }
                    }
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(25)
            .onChange(of: selectedIndex) {
                scrollView.scrollTo(selectedIndex, anchor: .center)
            }
        }
    }
}

#Preview {
    TabBarView(tabItems: ["Home", "AI", "Couples", "Settings", "Not Setings", "Etc."], selectedIndex: .constant(0))
}
