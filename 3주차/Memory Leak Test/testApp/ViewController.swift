//
//  ViewController.swift
//  testApp
//
//  Created by 천수현 on 2023/05/30.
//

import UIKit

final class ViewController: UIViewController {
  private let viewModel = ViewModel()

  deinit {
    print("deinit")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    bind()
  }

  func bind() {
    viewModel.closure = { [weak self] in //
      self?.viewModel.anotherClosuer = {
        // 이곳에서는 weak self를 캡쳐하지 않아도 주위 문맥을 통해 weak을 통해 캡쳐된 self를 사용할 수 있음
        print(self?.view.frame ?? "")
      }
    }
  }

  func bindWithMemoryLeak() {
    viewModel.closure = {
      // 내부의 클로저가 self를 캡쳐할때 weak self로 선언하더라도
      // self를 캡쳐해오는 문맥은 이 주석이 작성된 블록 내부이므로
      // 명시적으로 weak self 캡쳐를 진행하지 않았기에 묵시적으로 self가 strong 캡쳐됨
      // 그로 인해 ViewController의 instance가 메모리에서 해제되지 못하는 문제 발생
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
        print(self?.view.frame ?? "")
      }
    }
  }
}


final class ViewModel {
  var closure: (() -> Void)? {
    didSet { closure?() }
  }

  var anotherClosuer: (() -> Void)?
}
