//
//  LoginViewController.swift
//  DDUBUCK
//
//  Created by exception on 2021/03/27.
//

import Foundation
import UIKit
import NaverThirdPartyLogin
import Alamofire
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: UIViewController {
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
//    private let loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("네이버 로그인", for: .normal)
//        button.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    private let logoutButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("로그아웃", for: .normal)
//        button.addTarget(self, action: #selector(touchUpLogoutButton(_:)), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "회원이름"
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let emailLabel: UILabel = {
//        let label = UILabel()
//        label.text = "이메일"
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let nicknameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "별명"
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        layout()
//
//    }
//
//    @objc private func touchUpLoginButton(_ sender: UIButton) {
//        loginInstance?.delegate = self
//        loginInstance?.requestThirdPartyLogin()
//    }
//
//    @objc private func touchUpLogoutButton(_ sender: UIButton) {
//        loginInstance?.requestDeleteToken()
//    }
//
//    private func getNaverInfo() {
//        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
//
//        if !isValidAccessToken {
//            return
//        }
//
//        guard let tokenType = loginInstance?.tokenType else { return }
//        guard let accessToken = loginInstance?.accessToken else { return }
//        let urlStr = "https://openapi.naver.com/v1/nid/me"
//        let url = URL(string: urlStr)!
//
//        let authorization = "\(tokenType) \(accessToken)"
//
//        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
//
//        req.responseJSON { response in
//            guard let result = response.value as? [String: Any] else { return }
//            guard let object = result["response"] as? [String: Any] else { return }
//            guard let name = object["name"] as? String else { return }
//            guard let email = object["email"] as? String else { return }
//            guard let nickname = object["nickname"] as? String else { return }
//
//            self.nameLabel.text = "\(name)"
//            self.emailLabel.text = "\(email)"
//            self.nicknameLabel.text = "\(nickname)"
//        }
//    }
//
//    private func layout() {
//        let guide = view.safeAreaLayoutGuide
//
//        view.addSubview(loginButton)
//        view.addSubview(logoutButton)
//        view.addSubview(nameLabel)
//        view.addSubview(emailLabel)
//        view.addSubview(nicknameLabel)
//
//        loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//        loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
//
//        logoutButton.leadingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
//        logoutButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//        logoutButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
//        logoutButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
//
//        nameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//
//        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
//        emailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//        emailLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//
//        nicknameLabel.topAnchor
//            .constraint(equalTo: emailLabel.bottomAnchor, constant: 30).isActive = true
//        nicknameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//        nicknameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//    }
//
    @IBAction func clickKakaoLogin(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}

//extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
//    // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
//    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
//        //     let naverSignInVC = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)!
//        //     naverSignInVC.parentOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.orientation.rawValue)!
//        //     present(naverSignInVC, animated: false, completion: nil)
//    }
//    
//    // 로그인에 성공했을 경우 호출
////    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
////        print("[Success] : Success Naver Login")
//////        getNaverInfo()
////    }
//    
//    // 접근 토큰 갱신
//    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
//        
//    }
//    
//    // 로그아웃 할 경우 호출(토큰 삭제)
//    func oauth20ConnectionDidFinishDeleteToken() {
//        loginInstance?.requestDeleteToken()
//    }
//    
//    // 모든 Error
//    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
//        print("[Error] :", error.localizedDescription)
//    }
//}

