//
//  ViewController.swift
//  kadai6
//
//  Created by 松村直樹 on 2022/08/24.
//

import UIKit

public class ViewController: UIViewController {
    private var answer: Int = 0
    private let defaultValue: Int = 50
    @IBOutlet private weak var randomValue: UILabel!
    @IBOutlet private weak var slider: UISlider!

    override public func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    @IBAction private func judgementButton(_ sender: Any) {
        let answerValue = Int(randomValue.text ?? "")

        let result: String
        if answerValue == answer {
            result = "あたり！"
        } else {
            result = "ハズレ"
        }

        displayAlert(answerValue: "\(answer)", result: result)
    }

    @IBAction private func getSliderValue(_ sender: UISlider) {
        answer = Int(slider.value)
    }

    private func getRandomValue() -> String {
        // arc4randomではなく、型.randomを使用
        let randomInt = Int.random(in: 1 ... 100)
        return String(randomInt)
    }

    private func displayAlert(answerValue: String, result: String) {
        // Alert内容作成
        let alert = UIAlertController(title: "結果", message: "\(result)\nあなたの値:\(answerValue)", preferredStyle: .alert)
        // retryボタンアクション作成
        let retryButton = UIAlertAction(title: "Retry", style: .default, handler: {_ in self.resetGame()})
        // retryボタン機能追加
        alert.addAction(retryButton)
        // Alert表示
        present(alert, animated: true)
    }

    private func resetGame() {
        answer = defaultValue
        slider.value = Float(defaultValue)
        randomValue.text = getRandomValue()
    }
}
