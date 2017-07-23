//
//  ViewController.swift
//  BaiduDemo
//
//  Created by 尤家华 on 2017/7/22.
//  Copyright © 2017年 yjh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate,BMKRadarManagerDelegate, UITableViewDelegate {
    //百度地图View
    var _mapView: BMKMapView?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        _mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(_mapView!)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _mapView?.viewWillAppear()
        _mapView?.delegate = nil // 此处记得不用的时候需要置nil，否则影响内存的释放
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _mapView?.viewWillDisappear()
        _mapView?.delegate = nil // 不用时，置nil
    }
    override func viewDidAppear(_ animated: Bool) {
        //地图中心点坐标
        let center = CLLocationCoordinate2D(latitude: 31.245087, longitude: 121.506656)
        //设置地图的显示范围（越小越精确）
        let span = BMKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //设置地图最终显示区域
        let region = BMKCoordinateRegion(center: center, span: span)
        _mapView?.region = region
        
        // 添加一个标记点(PointAnnotation）
        let annotation =  BMKPointAnnotation()
        var coor = CLLocationCoordinate2D()
        coor.latitude = 31.254087
        coor.longitude = 121.512656
        annotation.coordinate = coor
        annotation.title = "这里有只野生皮卡丘"
        _mapView!.addAnnotation(annotation)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

