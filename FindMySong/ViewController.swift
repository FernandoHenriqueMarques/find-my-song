import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white

        let titleLabel = createTitleLabel()
        let loginButton = createLoginButton()
        let laterButton = createLaterButton()

        let buttonStack = UIStackView(arrangedSubviews: [loginButton, laterButton])
        buttonStack.axis = .vertical
        buttonStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        view.addSubview(buttonStack)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),

            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func createTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let text = "find my Song"
        let attributedText = NSMutableAttributedString(string: text)

        attributedText.addAttributes([
            .font: UIFont.boldSystemFont(ofSize: 32),
            .foregroundColor: UIColor.black
        ], range: NSRange(location: 0, length: 8))

        if let songRange = text.range(of: "Song") {
            let nsRange = NSRange(songRange, in: text)
            attributedText.addAttributes([
                .foregroundColor: UIColor(red: 128/255, green: 28/255, blue: 214/255, alpha: 1),
                .font: UIFont.boldSystemFont(ofSize: 32)
            ], range: nsRange)
        }

        titleLabel.attributedText = attributedText
        return titleLabel
    }

    func createLoginButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login with Spotify", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1)
        button.layer.cornerRadius = 25
        return button
    }

    func createLaterButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login Later", for: .normal)
        button.setTitleColor(UIColor(red: 128/255, green: 28/255, blue: 214/255, alpha: 1), for: .normal)
        return button
    }
}
