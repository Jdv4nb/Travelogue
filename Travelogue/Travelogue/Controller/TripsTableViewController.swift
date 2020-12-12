//
//  TripsTableViewController.swift
//  Travelogue
//
//  Created by Jonathan Van Egeren on 12/10/20.
//

import UIKit

class TripsTableViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        
        
        if let cell = cell as? TripTableViewCell {
            let trip = trips[indexPath.row]
            
            cell.TripLabel.text = trip.title
            cell.TripData.text = trip.data
        }
        return cell
    }
    

    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var tripDataLabel: UILabel!
    @IBOutlet var tripsTableView: UITableView!

    var trips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTrip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath ) -> [UIContextualAction]? {
        let deleteTrip = UIContextualAction(style: .destructive, title: "Delete") {_,_,_  in
        }
        return [deleteTrip]
    }
    
    func getTrip() {
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        
        do {
            trips = try managedContext.fetch(fetchRequest)
            tripsTableView.reloadData()
        } catch {
            print("Could not retrieve trips")
        }
    }




}
