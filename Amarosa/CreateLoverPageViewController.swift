//
//  CreateLoverPageViewController.swift
//  Amarosa
//
//  Created by Andrew Foghel on 7/14/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import Firebase
class CreateLoverPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var backBtn: UIButton?
    var createLbl: UILabel?
    var choosePicLbl: UILabel?
    var loverPageImageView: UIImageView?
    var startedDatingLbl: UILabel?
    var datingDate: UITextField?
    var lineInset: UILabel?
    var startUserNameLbl: UILabel?
    var userNameLblFirst: UITextField?
    var userNameLblSecond: UITextField?
    var infoLbl1: UILabel?
    var infoLbl2: UILabel?
    var infoLbl3: UILabel?
    var createPasscode: UILabel?
    var passcodeTxt: UITextField?
    var infoLbl4: UILabel?
    var infoLbl5: UILabel?
    var doneBtn: UIButton?
    


    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI(){
        backBtn = UIButton(frame: CGRect(x: width/80, y: width/20, width: width/9.14, height: width/9.14))
        backBtn?.setImage(#imageLiteral(resourceName: "Back arrow"), for: .normal)
        backBtn?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBack)))
        view.addSubview(backBtn!)
        
        createLbl = UILabel(frame: CGRect(x: 0, y: width/9, width: width, height: width/11))
        createLbl?.text = "Create Loverpage"
        createLbl?.font = UIFont(name: "Avenir Next", size: width/12.8)
        createLbl?.textAlignment = .center
        createLbl?.font = UIFont.boldSystemFont(ofSize: width/12.8)
        view.addSubview(createLbl!)
        
        choosePicLbl = UILabel(frame: CGRect(x: 0, y: (createLbl?.frame.origin.y)! + (createLbl?.frame.size.height)! + width/18.28, width: width, height: width/16))
        choosePicLbl?.text = "Choose Loverpic"
        choosePicLbl?.font = UIFont(name: "Avenir Next", size: width/16)
        choosePicLbl?.textAlignment = .center
        view.addSubview(choosePicLbl!)
        
        loverPageImageView = UIImageView(frame: CGRect(x: self.view.frame.midX - width/5, y: (choosePicLbl?.frame.origin.y)! + (choosePicLbl?.frame.size.height)! + width/32, width: width/2.5, height: width/5))
        loverPageImageView?.image = #imageLiteral(resourceName: "loverDefaultImage")
        loverPageImageView?.layer.cornerRadius = width/64
        loverPageImageView?.layer.masksToBounds = true
        loverPageImageView?.isUserInteractionEnabled = true
        loverPageImageView?.contentMode = .scaleAspectFill
        loverPageImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleChoosePhoto)))
        view.addSubview(loverPageImageView!)
        
        startedDatingLbl = UILabel(frame: CGRect(x: 0, y: (loverPageImageView?.frame.origin.y)! + (loverPageImageView?.frame.size.height)! + width/16, width: width, height: width/11))
        startedDatingLbl?.text = "Together Since"
        startedDatingLbl?.font = UIFont(name: "Avenir Next", size: width/16)
        startedDatingLbl?.textAlignment = .center
        view.addSubview(startedDatingLbl!)
        
        datingDate = UITextField()
        datingDate?.frame = CGRect(x: self.view.frame.midX - width/6.4, y: (startedDatingLbl?.frame.origin.y)! + (startedDatingLbl?.frame.size.height)! + width/128, width: width/3.2, height: width/16)
        datingDate?.text = "Jan 01, 2017"
        datingDate?.textAlignment = .center
        view.addSubview(datingDate!)
        
        lineInset = UILabel(frame: CGRect(x: self.view.frame.midX - width/4, y: (datingDate?.frame.origin.y)! + (datingDate?.frame.size.height)!, width: width/2, height: width/160))
        lineInset?.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        view.addSubview(lineInset!)
        
        startUserNameLbl = UILabel(frame: CGRect(x: 0, y: (lineInset?.frame.origin.y)! + (lineInset?.frame.size.height)! + width/16, width: width, height: width/11))
        startUserNameLbl?.textAlignment = .center
        startUserNameLbl?.text = "Start Username"
        startUserNameLbl?.font = UIFont(name: "Avenir Next", size: width/16)
        view.addSubview(startUserNameLbl!)
        
        userNameLblFirst = UITextField(frame: CGRect(x: self.view.frame.midX - width/2.7, y: (startUserNameLbl?.frame.origin.y)! + (startUserNameLbl?.frame.size.height)! + width/32, width: width/2.4, height: width/9))
        userNameLblFirst?.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        userNameLblFirst?.placeholder = "Username"
        userNameLblFirst?.font = UIFont(name: "Avenir Next", size: width/18)
        userNameLblFirst?.layer.zPosition = 3
        userNameLblFirst?.layer.cornerRadius = width/32
        view.addSubview(userNameLblFirst!)
        
        userNameLblSecond = UITextField(frame: CGRect(x: self.view.frame.midX, y: (startUserNameLbl?.frame.origin.y)! + (startUserNameLbl?.frame.size.height)! + width/32, width: width/2.4, height: width/9))
        userNameLblSecond?.backgroundColor = UIColor(red: 0.39, green: 0.39, blue: 0.39, alpha: 1)
        userNameLblSecond?.layer.cornerRadius = width/32
        userNameLblSecond?.layer.masksToBounds = true
        userNameLblSecond?.isUserInteractionEnabled = false
        view.addSubview(userNameLblSecond!)
        
        infoLbl1 = UILabel(frame: CGRect(x: 0, y: (userNameLblFirst?.frame.origin.y)! + (userNameLblFirst?.frame.size.height)! + width/32, width: width, height: width/21.3))
        infoLbl1?.textAlignment = .center
        infoLbl1?.text = "You create the first half of your loverpage username."
        infoLbl1?.font = UIFont(name: "Avenir Next", size: 12)
        infoLbl1?.textColor = UIColor.lightGray
        view.addSubview(infoLbl1!)
        
        infoLbl2 = UILabel(frame: CGRect(x: 0, y: (infoLbl1?.frame.origin.y)! + (infoLbl1?.frame.size.height)! + 1  , width: width, height: width/21.3))
        infoLbl2?.textAlignment = .center
        infoLbl2?.text = "Once your partner joins, they will complete the second;"
        infoLbl2?.font = UIFont(name: "Avenir Next", size: 12)
        infoLbl2?.textColor = UIColor.lightGray
        view.addSubview(infoLbl2!)
        
        infoLbl3 = UILabel(frame: CGRect(x: 0, y: (infoLbl2?.frame.origin.y)! + (infoLbl2?.frame.size.height)! + 1  , width: width, height: width/21.3))
        infoLbl3?.textAlignment = .center
        infoLbl3?.text = "the two halves will make up the full username!"
        infoLbl3?.font = UIFont(name: "Avenir Next", size: 12)
        infoLbl3?.textColor = UIColor.lightGray
        view.addSubview(infoLbl3!)
        
        createPasscode = UILabel(frame: CGRect(x: 0, y: (infoLbl3?.frame.origin.y)! + (infoLbl3?.frame.size.height)! + width/32, width: width, height: width/11))
        createPasscode?.textAlignment = .center
        createPasscode?.text = "Create Passcode"
        createPasscode?.font = UIFont(name: "Avenir Next", size: width/16)
        view.addSubview(createPasscode!)
        
        passcodeTxt = UITextField(frame: CGRect(x: self.view.frame.midX - width/6.4, y: (createPasscode?.frame.origin.y)! + (createPasscode?.frame.size.height)! + width/128, width: width/3.2, height: width/9))
        passcodeTxt?.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        passcodeTxt?.font = UIFont(name: "Avenir Next", size: width/18)
        passcodeTxt?.layer.cornerRadius = width/32
        view.addSubview(passcodeTxt!)
        
        infoLbl4 = UILabel(frame: CGRect(x: 0, y: (passcodeTxt?.frame.origin.y)! + (passcodeTxt?.frame.size.height)! + width/64  , width: width, height: width/21.3))
        infoLbl4?.textAlignment = .center
        infoLbl4?.text = "Your partner needs this passcode to join your page."
        infoLbl4?.font = UIFont(name: "Avenir Next", size: 12)
        infoLbl4?.textColor = UIColor.lightGray
        view.addSubview(infoLbl4!)

        doneBtn = UIButton(frame: CGRect(x: self.view.frame.midX - width/3.2, y: (infoLbl4?.frame.origin.y)! + (infoLbl4?.frame.height)! + width/16, width: width/1.6, height: width/9))
        doneBtn?.setTitle("Done", for: .normal)
        doneBtn?.setTitleColor(UIColor(red: 0.6, green: 0.58, blue: 0.98, alpha: 1), for: .normal)
        doneBtn?.titleLabel?.font = UIFont(name: "Avenir Next", size: 15)
        doneBtn?.layer.borderColor = UIColor(red: 0.6, green: 0.58, blue: 0.98, alpha: 1).cgColor
        doneBtn?.layer.borderWidth = 1
        doneBtn?.layer.cornerRadius = (doneBtn?.frame.size.height)!/2
        doneBtn?.layer.masksToBounds = true
        doneBtn?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlePostCreatedLoverPage)))
        view.addSubview(doneBtn!)
        
    }
    
    func handleBack(gesture: UITapGestureRecognizer){
        performSegue(withIdentifier: "createBack", sender: nil)
    }
    
    func handleChoosePhoto(gesture: UITapGestureRecognizer){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        loverPageImageView?.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func handlePostCreatedLoverPage(gesture: UITapGestureRecognizer){
        if loverPageImageView?.image == #imageLiteral(resourceName: "loverDefaultImage") {
            myAlert(title: "No Image Chosen", message: "You must choose an image for your lover page to continue")
        }else if datingDate?.text == "" {
            myAlert(title: "No Start Date Chosen", message: "You must choose a start date for your relationship to continue")
        }else if userNameLblFirst?.text == ""{
            myAlert(title: "No Username Chosen", message: "You must choose a username for your lover page to continue")
        }else if passcodeTxt?.text == ""{
            myAlert(title: "No Password Chosen", message: "You must choose a password for your lover page to continue")
        }else{
            guard let uid = Auth.auth().currentUser?.uid else{
                return
            }
            let uuid = UUID().uuidString
            
            Database.database().reference().child("users").child(uid).updateChildValues(["lovePage":uuid], withCompletionBlock: { (error, ref) in
                if let err = error{
                print(err.localizedDescription)
                return
                }
                print("saved to user db")
                })
           
            if let image = loverPageImageView?.image{
                let photoUuid = UUID().uuidString
                if let imageData = UIImageJPEGRepresentation(image, 0.5){
                    Storage.storage().reference().child("loverpage-images").child(photoUuid).putData(imageData, metadata: nil, completion: { (metadata, error) in
                        if let err = error{
                            print(err.localizedDescription)
                            return
                        }
                        
                        if let downloadUrl = metadata?.downloadURL()?.absoluteString{
                            let values: [String:AnyObject] = ["lovePageurl":downloadUrl as AnyObject, "lovers":[uid] as AnyObject, "relationshipStart":87743 as AnyObject,"username":self.userNameLblFirst?.text as AnyObject,"password":self.passcodeTxt?.text as AnyObject]
                            Database.database().reference().child("loverProfiles").child(uuid).setValue(values, withCompletionBlock: { (error, ref) in
                                if let err = error{
                                    print(err.localizedDescription)
                                    return
                                }
                                print("Created Lover Profile")
                            })
                        }
                        
                    })
                }
            }
            
        }
        
        
        
        
    }
    
    func myAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

