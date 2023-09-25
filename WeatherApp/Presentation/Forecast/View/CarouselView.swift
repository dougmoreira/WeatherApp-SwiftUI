import SwiftUI

struct CarouselItem: Identifiable {
    private(set) var id: UUID = .init()
    var color: Color
    var title: String
    var subTitle: String
    var temperature: Double
}

struct CarouselView<Content: View, TitleContent: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    
    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    @ViewBuilder var titleContent: (Binding<Item.Element>) -> TitleContent

    var body: some View {
        VStack(spacing: 20) {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach($data) { item in
                        VStack(spacing: 0) {
                            titleContent(item)
                                .frame(maxWidth: .infinity)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .offset(x: scrollOffset(geometryProxy))
                                }
                            content(item)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }

                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        
        return -minX * min(0.6, 1.0)
    }
}
