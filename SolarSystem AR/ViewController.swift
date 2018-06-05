//
//  ViewController.swift
//  SolarSystem AR
//
//  Created by Machine Horizon on 27/02/2018.
//  Copyright © 2018 Machine Horizon. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let earth = SCNNode(geometry: SCNSphere(radius: 0.2))
        earth.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "2k_earth_daymap (1)")
        earth.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "2k_earth_specular_map")
        earth.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "2k_earth_clouds")
        earth.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "2k_earth_normal_map")
        earth.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(earth)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        earth.runAction(forever)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Int {
    
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

