//
//  ViewController.swift
//  BundelPathDemo
//
//  Created by zhengyi on 2019/1/15.
//  Copyright © 2019 zhengyi. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController: UIViewController {
    
    var showResouceImageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //main bundle可以拿到的数据都是根目录的资源文件。但是更多一层的的bundle，car等无法访问。
        getBundleByCFBundle()
    }

    /// 获取main bundle下的资源
    func getMainBundleResource() {
        let path = Bundle.main.path(forResource: "placeholder@2x", ofType: "png")
        print("path is \(path ?? "")")
        addImageView(path: path)
    }
    
    /// 获取自定义Bundle下的资源
    func getSubBundlePath() {
        let IQKeyboradBundlePath = Bundle.main.path(forResource: "IQKeyboardManager", ofType: "bundle")
        print("keyboard path \(IQKeyboradBundlePath ?? "")")
        let arrowImagePath = IQKeyboradBundlePath! + "/IQButtonBarArrowDown"
        let IQKeyboardBundle = Bundle(path: IQKeyboradBundlePath ?? "")
        addImageView(path: arrowImagePath)

    }
    
    /// 获取资源路径
    func getResourcePath() {
        let main = Bundle.main
        let resourceURL = main.resourceURL
        let executableURL = main.executableURL
        let privateFramewirksURL = main.privateFrameworksURL
    }
    
    /// 获取Info.plist及其包含的数据
    func getInfoPlistData() {
        let infoPlist =  Bundle.main.infoDictionary
        let displayname = Bundle.main.object(forInfoDictionaryKey: "Bundle name")
        print("display name is \(displayname as! String)")
    }
    
    /// 获取自定义数据文件路径
    func getCustonDataResurcePath() {
        let plistpath = Bundle.main.path(forResource: "Insurance", ofType: "plist")
        print("insurance plist path \(plistpath ?? "")")
    }
    
    func getBundleByCFBundle() {
        let bundleUrl: CFURL
        let myBundle: CFBundle
        
        let path = "/var/containers/Bundle/Application/E3109171-73E4-425B-BBEE-7067C7E1D8F1/BundelPathDemo.app/IQKeyboardManager.bundle"
        bundleUrl = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, path as CFString, CFURLPathStyle.cfurlposixPathStyle, true)
        myBundle = CFBundleCreate(kCFAllocatorDefault, bundleUrl)
        
    }
    
    func addImageView(path: String?) {
        let image = UIImage(contentsOfFile: path!)
        showResouceImageView = UIImageView(image: image)
        view.addSubview(showResouceImageView!)
        showResouceImageView?.center = view.center
    }
}

