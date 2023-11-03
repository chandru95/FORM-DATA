import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
    
    //MARK: Outlets
    @IBOutlet weak var worktypebutton2: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var searchimage: UIImageView!
    @IBOutlet weak var textfieldview: UIView!
    @IBOutlet weak var searchview1: UIView!
    @IBOutlet weak var worklabel1: UILabel!
    @IBOutlet weak var worktypetableview: UITableView!
    @IBOutlet weak var addSession: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var worktypeeview: UIView!
    @IBOutlet weak var selectview1: UIView!
    @IBOutlet weak var firstSideTableView: UITableView!
    @IBOutlet weak var firstSideView: UIView!
    @IBOutlet weak var collection: UICollectionView!
    
    //MARK: Constants
    var sideview = 0
    var sessioncount = 1
    var workTypeSelected:String?
    var workTypeData = ["Admin Work","Camp Work","Cycle Meeting","Drs Survey","Field Work","Holiday","Induction Work","Leave","Meeting","No Field Work","Stockist Work","Super Stockist Work","Training","Transit","Weekly Off"]
    
    //MARK: Viewlifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postmethod()
        
        // Set the collection view's delegate and data source to self.
        collection.delegate = self
        selectview1.isHidden = true
        collection.dataSource = self
        firstSideView.isHidden = true
        firstSideTableView.allowsSelection = false
        let spacing:CGFloat = 0.0
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collection?.collectionViewLayout = layout
        searchview1.layer.borderColor = UIColor.blue.cgColor
        textfieldview.layer.borderColor = UIColor.blue.cgColor

    }
    
    //MARK: Collectionview Delegate & Datasource methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // You want 7 cells in a row and 6 rows, so return 7 * 6 = 42.
        return 6 * 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        // Customize the appearance of the cell and set the day's label text.
        if indexPath.row<31 {
            let dayNumber = indexPath.row + 1
            cell.Date.text = "\(dayNumber)"
        }
        else{
            
            cell.Date.text = ""
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //workTyoeSelected = false
        selectview1.isHidden = true
        firstSideView .isHidden = false
        workTypeSelected = nil
        firstSideTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 7   //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
    
    //MARK: BUtton Actions
    @IBAction func closeBtnAction(_ sender: Any) {
        firstSideView.isHidden = true
    }
    @IBAction func addsessionAction(_ sender: Any) {
        sessioncount+=1
        
        firstSideTableView.reloadData()
    }
    @IBAction func saveAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var sendToApprovalBtnAction: UIView!
    
    @IBAction func sendtoappbtn(_ sender: Any) {
    }
    
    //MARK: Tableview Delegate & Datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == worktypetableview) {
            return workTypeData.count
        }
        if (tableView == firstSideTableView){
            return sessioncount
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == worktypetableview) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "workcell", for: indexPath) as! WorkTypeTableViewCell
            cell.textLabel?.text = workTypeData[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if (tableView == firstSideTableView){
            if workTypeSelected != nil {
                cell.selectLabel.text = workTypeSelected
            }else {
                cell.selectLabel.text = "Select"
            }
            cell.worktypebutton1.addTarget(self, action: #selector(buttonPressed(sender: )), for: .touchUpInside)
            for i in 0...indexPath.row{
                
                if i == indexPath.row{
                    cell.sesionLabel.text = "Session "+String(i+1)
                    break
                }
            }
            return cell
        }
        else {
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == worktypetableview {
            addSession.isHidden = false
            save.isHidden = false
            selectview1.isHidden = true
            workTypeSelected = workTypeData[indexPath.row]
            firstSideTableView.reloadData()
            
        }
    }
    
    //MARK: Private methods
    @objc func buttonPressed(sender: UIButton) {
        // workTyoeSelected = true
        selectview1.isHidden = false
        addSession.isHidden = true
        save.isHidden = true
    }
}

