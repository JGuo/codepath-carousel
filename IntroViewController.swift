//
//  IntroViewController.swift
//  Carousel
//
//  Created by Jisi Guo on 2/10/16.
//  Copyright © 2016 Jisi Guo. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    
    @IBOutlet weak var tileOneImage: UIImageView!
    @IBOutlet weak var tileTwoImage: UIImageView!
    @IBOutlet weak var tileThreeImage: UIImageView!
    @IBOutlet weak var tileFourImage: UIImageView!
    @IBOutlet weak var tileFiveImage: UIImageView!
    @IBOutlet weak var tileSixImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImage.image!.size
        introScrollView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    var tileOneImageX: CGFloat!
    var tileOneImageY: CGFloat!
    var tileOneImageR: CGFloat!
    
    var tileTwoImageX: CGFloat!
    var tileTwoImageY: CGFloat!
    var tileTwoImageR: CGFloat!
    var tileTwoImageS: CGFloat!
    
    var tileThreeImageX: CGFloat!
    var tileThreeImageY: CGFloat!
    var tileThreeImageR: CGFloat!
    var tileThreeImageS: CGFloat!
    
    var tileFourImageX: CGFloat!
    var tileFourImageY: CGFloat!
    var tileFourImageR: CGFloat!
    var tileFourImageS: CGFloat!
    
    var tileFiveImageX: CGFloat!
    var tileFiveImageY: CGFloat!
    var tileFiveImageR: CGFloat!
    var tileFiveImageS: CGFloat!
    
    var tileSixImageX: CGFloat!
    var tileSixImageY: CGFloat!
    var tileSixImageR: CGFloat!
    var tileSixImageS: CGFloat!
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scrolling")
        print(introScrollView.contentOffset.y)
        
        tileOneImageX = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -80, r2Max: 0)
        tileOneImageY = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -280, r2Max: 0)
        tileOneImageR = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: CGFloat(-20 * M_PI / 180), r2Max: 0)
        tileOneImage.transform = CGAffineTransformMakeTranslation(tileOneImageX,tileOneImageY)
        tileOneImage.transform = CGAffineTransformRotate(tileOneImage.transform, CGFloat(tileOneImageR))
        
        
        tileTwoImageX = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 20, r2Max: 0)
        tileTwoImageY = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -130, r2Max: 0)
        tileTwoImageR = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: CGFloat(-20 * M_PI / 180), r2Max: 0)
        tileTwoImageS = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 2, r2Max: 1)
        tileTwoImage.transform = CGAffineTransformMakeTranslation(tileTwoImageX,tileTwoImageY)
        tileTwoImage.transform = CGAffineTransformRotate(tileTwoImage.transform, CGFloat(tileTwoImageR))
        tileTwoImage.transform = CGAffineTransformConcat(tileTwoImage.transform, CGAffineTransformMakeScale(tileTwoImageS,tileTwoImageS))
        
        tileThreeImageX = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 10, r2Max: 0)
        tileThreeImageY = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -210, r2Max: 0)
        tileThreeImageR = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: CGFloat(20 * M_PI / 180), r2Max: 0)
        tileThreeImageS = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 2, r2Max: 1)
        tileThreeImage.transform = CGAffineTransformMakeTranslation(tileThreeImageX,tileThreeImageY)
        tileThreeImage.transform = CGAffineTransformRotate(tileThreeImage.transform, CGFloat(tileThreeImageR))
        tileThreeImage.transform = CGAffineTransformConcat(tileThreeImage.transform, CGAffineTransformMakeScale(tileThreeImageS,tileThreeImageS))
        
        tileFourImageX = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 40, r2Max: 0)
        tileFourImageY = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -190, r2Max: 0)
        tileFourImageR = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: CGFloat(10 * M_PI / 180), r2Max: 0)
        tileFourImageS = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 2, r2Max: 1)
        tileFourImage.transform = CGAffineTransformMakeTranslation(tileFourImageX,tileFourImageY)
        tileFourImage.transform = CGAffineTransformRotate(tileFourImage.transform, CGFloat(tileFourImageR))
        tileFourImage.transform = CGAffineTransformConcat(tileFourImage.transform, CGAffineTransformMakeScale(tileFourImageS,tileFourImageS))
        
        tileFiveImageX = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -50, r2Max: 0)
        tileFiveImageY = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -250, r2Max: 0)
        tileFiveImageR = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: CGFloat(5 * M_PI / 180), r2Max: 0)
        tileFiveImageS = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 2, r2Max: 1)
        tileFiveImage.transform = CGAffineTransformMakeTranslation(tileFiveImageX,tileFiveImageY)
        tileFiveImage.transform = CGAffineTransformRotate(tileFiveImage.transform, CGFloat(tileFiveImageR))
        tileFiveImage.transform = CGAffineTransformConcat(tileFiveImage.transform, CGAffineTransformMakeScale(tileFiveImageS,tileFiveImageS))
        
        tileSixImageX = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -40, r2Max: 0)
        tileSixImageY = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: -240, r2Max: 0)
        tileSixImageR = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: CGFloat(-16 * M_PI / 180), r2Max: 0)
        tileSixImageS = convertValue(introScrollView.contentOffset.y, r1Min:0 , r1Max: 568, r2Min: 2, r2Max: 1)
        tileSixImage.transform = CGAffineTransformMakeTranslation(tileSixImageX,tileSixImageY)
        tileSixImage.transform = CGAffineTransformRotate(tileSixImage.transform, CGFloat(tileSixImageR))
        tileSixImage.transform = CGAffineTransformConcat(tileSixImage.transform, CGAffineTransformMakeScale(tileSixImageS,tileSixImageS))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
