//
//  AndroidTableView.swift
//  DoctorFei_Patient_iOS
//
//  Created by shadowPriest on 3/28/15.
//
//

import UIKit
@objc protocol androidTableViewDelegate{
    optional func androidTableView(androidTableView:AndroidTableView,didSelectRowAtIndexPath indexPath:NSIndexPath)
}
@objc protocol androidTableViewDataSource{
    func androidTableView(androidTableView:AndroidTableView, numberOfRowsInSection section:Int) -> Int
    func androidTableView(androidTableView:AndroidTableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> String
}
@objc class AndroidTableView: UIView ,UITableViewDelegate,UITableViewDataSource{
    var backgroudView:UIView!
    var horizontalView:UIView!
    var verticalView:UIView!
    var cityButton:UIButton!
    var areaButton:UIButton!
    var tableView:UITableView!
    var delegate:androidTableViewDelegate?
    var dataSource:androidTableViewDataSource?
    let androidTableViewCellIdentifier = "AndroidTableViewCellIdentifier"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroudView = UIView(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        backgroudView.backgroundColor = UIColor(white: 0.0, alpha: 0.9)
        self.addSubview(self.backgroudView)
        tableView = UITableView(frame: frame, style: UITableViewStyle.Plain)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        cityButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        areaButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        cityButton.setTitleColor(UIColor(white: 176.0/255.0, alpha: 1.0), forState: UIControlState.Normal)
        cityButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Selected)
        areaButton.setTitleColor(UIColor(white: 176.0/255.0, alpha: 1.0), forState: UIControlState.Normal)
        areaButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Selected)
        horizontalView = UIView()
        verticalView = UIView()
        horizontalView.backgroundColor = UIColor(white: 176.0/255.0, alpha: 1.0)
        verticalView.backgroundColor = UIColor(white: 176.0/255.0, alpha: 1.0)
        backgroudView.addSubview(tableView);
        backgroudView.addSubview(cityButton)
        backgroudView.addSubview(areaButton)
        backgroudView.addSubview(verticalView)
        backgroudView.addSubview(horizontalView)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func showInView(sView: UIView!){
        self.layoutWithSuperView(sView)
        sView.addSubview(self)
    }
    func dismiss(){
        self.removeFromSuperview()
    }
    func layoutWithSuperView(sView: UIView!){
        self.frame = sView.bounds
        let width = self.frame.size.width
        let height = self.frame.size.height
        cityButton.frame = CGRect(x: 0, y: 64, width: width / 2 - 1, height: 40)
        areaButton.frame = CGRect(x: width / 2 + 1, y: 64, width: width / 2 - 1, height: 40)
        verticalView.frame = CGRect(x: width / 2, y: 64, width: 1, height: 40)
        horizontalView.frame = CGRect(x: 0, y: 40, width: width, height: 1)
        tableView.frame = CGRect(x: 0, y: 41, width: width, height: 320)
    }
    // MARK:TableViewDelegat&DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ret = self.dataSource?.androidTableView(self, numberOfRowsInSection: section)
        return ret!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(androidTableViewCellIdentifier) as UITableViewCell?
        if ((cell) == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: androidTableViewCellIdentifier)
        }
        cell?.textLabel?.text = self.dataSource?.androidTableView(self, cellForRowAtIndexPath: indexPath)
        return UITableViewCell()
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}