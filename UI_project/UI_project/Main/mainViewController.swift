//
//  ViewController.swift
//  UI_project
//
//  Created by Дмитрий on 03.09.2021.
//

import UIKit

class mainViewController: UIViewController {
    //делаем аутлет для scrollview
    @IBOutlet weak var loginScrollView: UIScrollView!
    
// делаем аутлеты для поля логин
    @IBOutlet private weak var loginTextField: UITextField!
    // делаем аутлет для поля пароль
    @IBOutlet private weak var passwordTextField: UITextField!

//  расшариваем singleton
    let session = Session.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //добавляем вызов метода, который обрабатывает нажатия и убирает клавиатуру
        self.addGesture()
    }
    
    //добавляем функцию viewWillAppear, которая работает, когда появляется viewController, чтобы добавить в него observer (наблюдателя)
    override func viewWillAppear(_ animated: Bool) {
        //вызываем базовый инициализатор
        super.viewWillAppear(animated)
        //вызываем функцию по добавлению наблюдателей
        self.addObservers()
    }
    
    //добавляем функцию viewWillDisappear, которая работает, когда исчезает (или готовится исчезнуть) viewController, чтобы удалить наблюдателя
    
    override func viewWillDisappear(_ animated: Bool) {
        //вызываем базовый инициализатор
        super.viewWillDisappear(animated)
        //вызываем функцию по удалению наблюдателей
        self.removeObservers()
    }
    
    //делаем функцию, которая будет добавлять наблюдателей и подписываться на уведомления
    private func addObservers(){
        //добавляем подписку на отображение клавиатуры
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //добавляем подписку на исчезновение клавиатуры
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    //делаем функцию, которая будет удалять наблюдателей
    private func removeObservers(){
        //удаляем подписку на отображение клавиатуры
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //удаляем подписку на исчезновение клавиатуры
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    //добавляем функцию, которая вызывается наблюдателем, когда клавиатура появляется
    @objc private func handleKeyboardWillShow(){
        //делаем отступ для скроллинга
        self.loginScrollView.contentInset.bottom += 220
    }
    //добавляем функцию, которая вызывается наблюдателем, когда клавиатура исчезает
    @objc private func handleKeyboardWillHide(){
        self.loginScrollView.contentInset.bottom = 0
    }
    
    //добавляем функцию по обработке нажатий на экран
    private func addGesture(){
        //создаём константу типа UITapGestureRecognizer, которая вызывает функцию handleGesture при нажатии
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        //добавляем константу с gestureRecognizer в scrollView
        self.loginScrollView.addGestureRecognizer(gesture)
    }
    //добавляем функцию, которая обрабатывает нажатия
    @objc private func handleGesture(){
        //убираем клавиатуру при нажатии
        self.loginScrollView.endEditing(true)
        
    }
//описываем функцию по проверке логина и пароля при нажатии на клавишу
    @IBAction private func loginButtonPressed(_ sender: Any) {
        //объявляем переменные с логином и паролем
        let login = loginTextField.text
        let pass = passwordTextField.text
        //проверяем логин и пароль
        if login == "s" && pass == "" {
            self.showDebugScene()
        } else {
            self.showAuthAlert()
        }
        
        
    }
    //функция, вызывающая алерт при вводе неправильного логина или пароля
    private func showAuthAlert(){
        //делаем алерт контролер
        let ac = UIAlertController(
            title: "Ошибка",
            message: "Логин или пароль введены неверно",
            preferredStyle: .alert)
        //делаем action для алерта
        let action = UIAlertAction(
            title: "Ну хорошо",
            style: .default)
        //добавляем action к контроллеру
        ac.addAction(action)
        //показываем алерт
        self.present(ac, animated: true)
    }
    
    private func showDebugScene(){
        let storyBoard = UIStoryboard(name: "DebugMenu", bundle: nil)
        let debugViewController = storyBoard.instantiateInitialViewController()
        debugViewController?.modalPresentationStyle = .fullScreen
        if let viewController = debugViewController as? DebugMenuViewController {
            self.present(viewController, animated: true)
        }
    }
}

