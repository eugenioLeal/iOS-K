//
//  ViewController.swift
//  InteractiveLink
//
//  Created by Eugenio Leal on 09/09/22.
//

import UIKit


class ViewController: UIViewController, UITextViewDelegate {
    
    let stackView = UIStackView()
    let textView = UITextView()
    
    let str: NSString = "He leído, entiendo y acepto estar sujeto a los Términos y Condiciones de Alpaca Securities LLC y Sherpa Brokers LLC y a todos los otros términos, divulgaciones y afirmaciones aplicadas a mi en relación al Acuerdo de Cliente de Alpaca. También reconozco que el Acuerdo de Cliente de Alpaca. También reconozco que el acuerdo de Cliente de Alpaca contiene una clausula de  arbitraje previo a disputa en la Sección 43. Así como el Aviso de Privacidad de Rapyd.";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        let tosRange: NSRange = str.range(of: "Términos y Condiciones")
        let privRange: NSRange = str.range(of: "Aviso de Privacidad")
        let rootAttStr = NSMutableAttributedString(string: String(str))
        rootAttStr.addAttribute(.link, value: "https://tos.com", range: tosRange)
        rootAttStr.addAttribute(.link, value: "https://google.com", range: privRange)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        textView.attributedText = rootAttStr
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
    }
    
    func layout() {
        stackView.addArrangedSubview(textView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.topAnchor, multiplier: 30),
            textView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("clicked url", URL, characterRange)
        if URL.absoluteString == "https://tos.com" {
            print("don't open safari just push in navigation")
            return false
        } else {
            return true
        }
    }
    
    
}



