//
//  NewTripViewController.swift
//  Travelogue
//
//  Created by Jonathan Van Egeren on 12/10/20.
//

import UIKit

class NewTripViewController: UIViewController {

    @IBOutlet weak var TripNameLabel: UILabel!
    @IBOutlet weak var TripDataLabel: UILabel!
    @IBOutlet weak var tripNameField: UITextField!
    @IBOutlet weak var tripDataField: UITextField!
    @IBOutlet weak var TripDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func saveNewTrip(_ sender: Any) {
        guard let tripName = tripNameField.text, let tripData = tripDataField.text else {
            print("No trip title or description set")
            return
        }
        let trip = Trip(title: tripName, data: tripData)
        
        do {
            try trip.managedObjectContext.save();
            
            self.navigationController?.popViewController(animated: true)
            
        } catch {
            print("There was an error saving the new trip")
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
