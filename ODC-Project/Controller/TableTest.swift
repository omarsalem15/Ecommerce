//
//  TableTest.swift
//  ODC-Project
//
//  Created by Omar Salem on 25/07/2023.
//

import UIKit

class TableTest: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let obj = NetworkManager()
    
    obj.getData(completion: T##([Products]?) -> Void)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var tblTest: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
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
