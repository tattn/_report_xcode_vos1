import SwiftUI

struct ContentView: View {
    @State private var state = false
    var body: some View {

        Button("Change WindowScene Geometry", action: changeSceneGeometry)
            .background {
                HostingViewController(state: state)
            }
    }

    private func changeSceneGeometry() {
        state.toggle()
    }
}

struct HostingViewController: UIViewControllerRepresentable {
    let state: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard let window = uiViewController.view.window,
              let scene = window.windowScene else { return }

        let geometry = UIWindowScene.GeometryPreferences.Vision(
            size: window.bounds.size
        )

        scene.requestGeometryUpdate(geometry)

        // If you'd like to see the error, use the following:
//        scene.requestGeometryUpdate(geometry) { error in
//            print(error)
//        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
