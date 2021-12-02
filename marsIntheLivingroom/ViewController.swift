//
//  ViewController.swift
//  marsIntheLivingroom
//
//  Created by Yu Jin on 12/1/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
                sceneView.delegate = self
                
                // Show statistics such as fps and timing information
                sceneView.showsStatistics = true
                
               //Object
                let sphere = SCNSphere(radius: 0.5)
                
                
                
                //Material
                let material = SCNMaterial()
                
                
                material.diffuse.contents = UIImage(named: "art.scnassets/2k_mars.jpeg")
                
               //Integrate Material to Object
                sphere.materials = [material]
                
                
                //Create Node
                let node = SCNNode()
                
                //Set Position
                node.position = SCNVector3(x: 0, y: 0, z: -2)
                
                //Add object to node
                node.geometry = sphere
                
                
            //Add Node to Scene
                sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
