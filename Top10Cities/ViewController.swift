

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        
       static let cityIdentifier : String = "CityIdentifier"
        
       static let top10Cities = [
            "Mumbai",
            "Chennai",
            "Bengaluru",
            "Pune",
            "Noida",
            "Maharastra",
            "Kolkata",
            "Coimbatore",
            "Goa",
            "Rajestan",
            "Kerala"
        ]  
        static let top10CitiesMap = [
            "Mumbai":"IN",
            "Chennai":"IN",
            "Bengaluru" :"IN",
            "Pune" :"IN",
            "Noida" :"IN",
            "Maharastra" :"IN",
            "Kolkata" :"IN",
            "Coimbatore" :"IN",
            "Goa" :"IN",
            "Rajestan" :"IN",
            "Kerala" :"IN"
        ]
    }
    
    @IBOutlet var tblView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cityIdentifier)
        
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.top10Cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvCell = tableView.dequeueReusableCell(withIdentifier: Constants.cityIdentifier, for: indexPath)
        
        var cellConfig = tvCell.defaultContentConfiguration()
        
        cellConfig.text = Constants.top10Cities[indexPath.row]
        cellConfig.secondaryText = Constants.top10CitiesMap[Constants.top10Cities[indexPath.row]]
        
        tvCell.contentConfiguration = cellConfig
        
        return tvCell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //just print on tap
        print("City: \(Constants.top10Cities[indexPath.row])")
        print("Country: \(String(describing: Constants.top10CitiesMap[Constants.top10Cities[indexPath.row]]))")
    }
}

