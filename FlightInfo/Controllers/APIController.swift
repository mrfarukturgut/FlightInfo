//
//  APIController.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 11.02.2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit
import WebKit
import SwiftSoup
import Kanna


class APIController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "program", withExtension: "html")
        //let url = URL(string: "https://crewduty.thy.com")
        webView.load(URLRequest(url: url!))
        webView.allowsLinkPreview = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMonthlyProgram(_ sender: Any) {
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()", completionHandler: { (outerHTML: Any?, error: Error?) in
            
            var duties : [XMLElement?] = []
            let decimalCharacters = CharacterSet.decimalDigits
            
            let html = outerHTML as! String
            if let doc = try? HTML(html: html, encoding: .utf8){
                if let contianerDiv = doc.css("a[id*='roster_activity']").first?.parent{
                    for span in contianerDiv.css("span[id*='j_idt']"){
                        for title in span.css("span.ui-panel-title"){
                            let text = title.text
                            let decimalRange = text!.rangeOfCharacter(from: decimalCharacters)
                            if decimalRange != nil {
                                duties.append(title.parent?.parent)
                            }
                        }
                    }
                }
            }
            DutyManager.shared.parseDuty(duties: duties)
            //dump(DutyManager.shared.duties)
        })
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("commited")
        dump(webView)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished")
        dump(navigation)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("failed")
        dump(error)
        dump(navigation)
    }
    
    private func webView(webView: WKWebView!, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error!) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
