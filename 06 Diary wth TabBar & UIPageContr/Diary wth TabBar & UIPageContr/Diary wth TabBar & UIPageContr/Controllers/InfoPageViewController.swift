//
//  InfoPageViewController.swift
//  Diary wth TabBar & UIPageContr
//
//  Created by Jaroslav Stupinskyi on 18.06.18.
//  Copyright © 2018 Jaroslav Stupinskyi. All rights reserved.
//

import UIKit

class InfoPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var vcOrder: [UIViewController] = {
        return [self.newVC(vcIdentifier: "1st"),
                self.newVC(vcIdentifier: "2nd"),
                self.newVC(vcIdentifier: "3rd")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstVC = vcOrder.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func newVC(vcIdentifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vcIdentifier)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcOrder.index(of: viewController) else { return nil }
        let nextIndex = vcIndex + 1
        guard vcOrder.count != nextIndex else { return vcOrder.first }
        guard vcOrder.count > nextIndex else { return nil }
        
        return vcOrder[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcOrder.index(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else { return vcOrder.last }
        guard vcOrder.count > previousIndex else { return nil }
        
        return vcOrder[previousIndex]
    }
}
