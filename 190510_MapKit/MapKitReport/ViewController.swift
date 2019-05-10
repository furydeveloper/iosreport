//
//  ViewController.swift
//  MapKitReport
//
//  Created by Fury on 10/05/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    private var placeNum = 0
    var temp: CLLocationCoordinate2D!
    var isFirstRectangle = true
    
    let topToolBar: UIToolbar = {
        let topToolBar = UIToolbar()
        topToolBar.translatesAutoresizingMaskIntoConstraints = false
        topToolBar.sizeToFit()
        return topToolBar
    }()
    
    let addrText: UITextField = {
        let addrText = UITextField()
        addrText.borderStyle = .roundedRect
        addrText.translatesAutoresizingMaskIntoConstraints = false
        return addrText
    }()
    
    let myMap: MKMapView = {
        let myMap = MKMapView()
        myMap.translatesAutoresizingMaskIntoConstraints = false
        return myMap
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configure()
        addSubView()
        autoLayout()
    }
    
    private func addAnnotation(_ originAddress: String, _ geoAddress: CLPlacemark) {
        // MapView delegate
        myMap.delegate = self
        
        // 장소 count -> 첫번째 행선지인이 아닌지 비교할때도 사용
        placeNum += 1
        
        // span, region 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: geoAddress.location!.coordinate, span: span)
        
        // 위도, 경도 값 저장
        let latitude = geoAddress.location!.coordinate.latitude
        let longitude = geoAddress.location!.coordinate.longitude
        
        // addAnnotaition의 위치 정보 입력
        let destination = MKPointAnnotation()
        destination.title = "\(placeNum)번째 행선지"
        destination.subtitle = originAddress
        destination.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        if placeNum == 1 {
            // placeNum == 1 의 경우, 첫번째 행선지 => 직선을 만들 필요가 없음
        } else {
            // 이전 행선지와 현재 행선지를 선으로 연결
            addLine(temp, geoAddress.location!.coordinate)
        }
        
        // 현재 행선지를 네모로 표시
        addRectangle(geoAddress.location!.coordinate)
        
        myMap.addAnnotation(destination)
        myMap.setRegion(region, animated: true)
    }
    
    // 선을 긋는 메서드
    private func addLine(_ firstSender: CLLocationCoordinate2D, _ secondSender: CLLocationCoordinate2D) {
        let point1 = firstSender
        let point2 = secondSender
        
        let points: [CLLocationCoordinate2D] = [point1, point2]
        
        let line = MKPolyline(coordinates: points, count: points.count)
        
        myMap.addOverlay(line)
    }
    
    // 네모를 만드는 메서드
    private func addRectangle(_ sender: CLLocationCoordinate2D) {
        let center = sender
        temp = center
        
        var point1 = center; point1.longitude -= 0.0035;   point1.latitude += 0.0025
        var point2 = center; point2.longitude += 0.0035;   point2.latitude += 0.0025
        var point3 = center; point3.longitude += 0.0035;  point3.latitude -= 0.0025
        var point4 = center; point4.longitude -= 0.0035;  point4.latitude -= 0.0025
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        
        let rectangleLine = MKPolyline(coordinates: points, count: points.count)
        
        myMap.addOverlay(rectangleLine)
    }
    
    // 맵 검색 (geocoder 사용하여 주소를 좌표로 변환)
    private func searchMap(_ addr: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(addr) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let address = placeMark?.first else { return }
            self.addAnnotation(addr, address)
        }
    }
    
    private func configure() {
        addrText.delegate = self
    }
    
    private func addSubView() {
        view.addSubview(topToolBar)
        view.addSubview(addrText)
        view.addSubview(myMap)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        let margin: CGFloat = 5
        NSLayoutConstraint.activate([
            topToolBar.topAnchor.constraint(equalTo: guide.topAnchor),
            topToolBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            topToolBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            
            addrText.topAnchor.constraint(equalTo: topToolBar.topAnchor, constant: margin),
            addrText.leadingAnchor.constraint(equalTo: topToolBar.leadingAnchor, constant: margin * 2),
            addrText.trailingAnchor.constraint(equalTo: topToolBar.trailingAnchor, constant: -margin * 2),
            addrText.bottomAnchor.constraint(equalTo: topToolBar.bottomAnchor, constant: -margin),
            
            myMap.topAnchor.constraint(equalTo: topToolBar.bottomAnchor),
            myMap.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            myMap.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            myMap.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        // textField의 값이 있을 때, searchMap() 메서드를 호출
        searchMap(text)
        return true
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .red
            renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}

