import Lottie
extension AnimationView {

    func startAnimation() {
        self.isHidden = false
        self.play()
    }

    func stopAnimation() {
        self.isHidden = true
        self.stop()
    }
}
