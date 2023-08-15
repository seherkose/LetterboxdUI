//
//
//  LetterboxdUI
//
//  Created by Seher Köse on 9.08.2023.
//

import UIKit

class CustomHeaderView: UIView {
   
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 20.0)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainPage: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var movieTableView:UITableView!
    
    var data = [MovieData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.delegate = self
        movieTableView.dataSource = self

      
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Avenir Next Bold", size: 15)!,
            .foregroundColor: UIColor.lightGray
        ]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)

        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        let m1 = MovieData(sectionType: "Popular This Week", movies: ["Barbie", "Oppenheimer", "Ninja Turtles", "Suspiria", "Talk To Me", "Batman Gotham By Gaslight"], movieImage: ["barbie", "oppenheimer", "ninjaturtles","suspiria", "talktome", "batman"])
        
        let m2 = MovieData(sectionType: "New From Friends", movies: ["Medusa", "The Party", "Two Fast", "Batman Gotham By Gaslight", "Barbie", "Oppenheimer"], movieImage: ["medusa", "batman2", "twofast","theparty", "barbie2", "oppenheimer2"])
        
        let m3 = MovieData(sectionType: "Popular With Friends", movies: ["Mazzey", "Meg", "Talk To Me", "Astreoidcity", "Barbie", "Oppenheimer"], movieImage: ["mazzey", "meg", "talktome", "astreoidcity", "barbie3", "oppenheimer3"])
        
        data.append(m1)
        data.append(m2)
        data.append(m3)
    }

}

extension MainPage: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].sectionType
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        let sectionData = data[indexPath.section]
        cell.movieData = sectionData
        cell.collectionView.tag = indexPath.section
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeaderView()
        headerView.backgroundColor = .black
        headerView.titleLabel.text = data[section].sectionType
          
        return headerView
    }
    
}

