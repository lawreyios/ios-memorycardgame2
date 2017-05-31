//
//  HKKidsManager.swift
//  CCH078
//
//  Created by Lawrence Tan on 10/2/17.
//  Copyright © 2017 Lawrey. All rights reserved.
//

import Foundation

final class HKKidsManager {
    
    var kids = [CCH078Kid]()
    var houses = [CCH078House]()
    
    var birthdays = [Int: [CCH078Kid]]()
    
    class func sharedInstance() -> HKKidsManager {
        
        struct Singleton {
            static var instance = HKKidsManager()
        }
        
        return Singleton.instance
        
    }
    
    func initKids() {
        
        let DanicaDjokic = CCH078Kid(name: "Danica Djokic", dob: "NA", age: "NA", study: "NA", serviceType: .SmallSun, dobMonth: 0)
        let JovinaLew = CCH078Kid(name: "Jovina Lew", dob: "27-02-2008", age: self.getAge("27-02-2008"), study: "P2", serviceType: .SmallSat, dobMonth: 2)
        let SheriseOng = CCH078Kid(name: "Sherise Ong", dob: "28-11-2005", age: self.getAge("28-11-2005"), study: "P5", serviceType: .BigFri, dobMonth: 11)
        let SeiferOng = CCH078Kid(name: "Seifer Ong", dob: "22-10-2007", age: self.getAge("22-10-2007"), study: "P3", serviceType: .BigFri, dobMonth: 10)
        let ShmuelOng = CCH078Kid(name: "Shmuel Ong", dob: "01-09-2011", age: self.getAge("1-09-2011"), study: "K1", serviceType: .BigFri, dobMonth: 9)
        let XuZhiKai = CCH078Kid(name: "Xu Zhi Kai", dob: "04-04-2011", age: self.getAge("4-04-2011"), study: "K1", serviceType: .SmallSun, dobMonth: 4)
        let WenXuan = CCH078Kid(name: "Wen Xuan", dob: "13-10-2008", age: self.getAge("13-10-2008"), study: "P2", serviceType: .BigSat11, dobMonth: 10)
        let WenBin = CCH078Kid(name: "Wen Bin", dob: "16-08-2010", age: self.getAge("16-08-2010"), study: "K2", serviceType: .BigSat11, dobMonth: 8)
        let Xuan = CCH078Kid(name: "Wong Yong Xuan", dob: "28-01-2016", age: self.getAge("28-01-2016"), study: "NA", serviceType: .BigSat11, dobMonth: 1)
        let Jun = CCH078Kid(name: "Wong Yong Jun", dob: "NA", age: "NA", study: "NA", serviceType: .BigSat11, dobMonth: 0)
        let Sophia = CCH078Kid(name: "Sophia Potter", dob: "17-11-2006", age: self.getAge("17-11-2006"), study: "P4", serviceType: .BigFri, dobMonth: 11)
        let Laurence = CCH078Kid(name: "Laurence Gavin Potter", dob: "13-05-2008", age: self.getAge("13-05-2008"), study: "P2", serviceType: .BigFri, dobMonth: 5)
        let Amanda = CCH078Kid(name: "Amanda Cordelia Potter", dob: "13-05-2008", age: self.getAge("13-05-2008"), study: "P2", serviceType: .BigFri, dobMonth: 5)
        let Yun = CCH078Kid(name: "Yun Xi", dob: "01-03-2006", age: self.getAge("01-03-2006"), study: "P4", serviceType: .BigFri, dobMonth: 3)
        let Zu = CCH078Kid(name: "Zu Peng", dob: "07-08-2016", age: self.getAge("07-08-2016"), study: "NA", serviceType: .None, dobMonth: 8)
        let Evan = CCH078Kid(name: "Evan Tay", dob: "14-10-2010", age: self.getAge("14-10-2010"), study: "K2", serviceType: .SmallSat, dobMonth: 10)
        let Edlyn = CCH078Kid(name: "Ying Ru Edlyn", dob: "31-05-2010", age: self.getAge("31-05-2010"), study: "NA", serviceType: .SmallSat, dobMonth: 5)
        let Cheyenne = CCH078Kid(name: "Cheyenne Wong", dob: "05-10-2009", age: self.getAge("05-10-2009"), study: "P1", serviceType: .SmallSat, dobMonth: 10)
        let Janine = CCH078Kid(name: "Janine Wong", dob: "21-12-2011", age: self.getAge("21-12-2011"), study: "K1", serviceType: .SmallSat, dobMonth: 12)
        let Gillian = CCH078Kid(name: "Gillian Soh", dob: "09-03-2005", age: self.getAge("09-03-2005"), study: "P5", serviceType: .SmallSat, dobMonth: 3)
        let Aziel = CCH078Kid(name: "Aziel", dob: "29-04-2008", age: self.getAge("29-04-2008"), study: "NA", serviceType: .BigSat11, dobMonth: 4)
        let Elizabeth = CCH078Kid(name: "Elizabeth John Achsah", dob: "24-11-2010", age: self.getAge("24-11-2010"), study: "K2", serviceType: .BigSat11, dobMonth: 11)
        let Zoe = CCH078Kid(name: "Ng Zoe", dob: "13-12-2005", age: self.getAge("13-12-2005"), study: "P5", serviceType: .BigFri, dobMonth: 12)
        let Liz = CCH078Kid(name: "Ng En Xi Liz", dob: "14-06-2011", age: self.getAge("14-06-2011"), study: "K1", serviceType: .BigFri, dobMonth: 6)
        let Ziv = CCH078Kid(name: "Ziv Ng Sheng Jie", dob: "NA", age: "NA", study: "NA", serviceType: .BigFri, dobMonth: 0)
        let Sarah = CCH078Kid(name: "Sarah Liao Xin Ge", dob: "13-09-2009", age: self.getAge("13-09-2009"), study: "P1", serviceType: .BigFri, dobMonth: 9)
        let Daniel = CCH078Kid(name: "Daniel Liao", dob: "23-04-2015", age: self.getAge("23-04-2015"), study: "NA", serviceType: .BigFri, dobMonth: 4)
        let Ryanne = CCH078Kid(name: "Ryanne Peh En Xuan", dob: "", age: self.getAge(""), study: "NA", serviceType: .SmallSat, dobMonth: 0)
        let Vaness = CCH078Kid(name: "Vaness", dob: "14-08-2009", age: self.getAge("14-08-2009"), study: "NA", serviceType: .BigFri, dobMonth: 8)
        let Renee = CCH078Kid(name: "Renee", dob: "21-01-2008", age: self.getAge("21-01-2008"), study: "NA", serviceType: .BigSat11, dobMonth: 1)
        let Kaiser = CCH078Kid(name: "Kaiser", dob: "19-01-2013", age: self.getAge("19-01-2013"), study: "NA", serviceType: .BigSat11, dobMonth: 1)
        let Lucas = CCH078Kid(name: "Lucas Chapman", dob: "", age: self.getAge(""), study: "NA", serviceType: .SmallSun, dobMonth: 0)
        let Esther = CCH078Kid(name: "Esther Ng", dob: "", age: self.getAge(""), study: "NA", serviceType: .SmallSun, dobMonth: 0)

        
        kids.append(DanicaDjokic)
        kids.append(JovinaLew)
        kids.append(SheriseOng)
        kids.append(SeiferOng)
        kids.append(ShmuelOng)
        kids.append(XuZhiKai)
        kids.append(WenXuan)
        kids.append(WenBin)
        kids.append(Xuan)
        kids.append(Jun)
        kids.append(Sophia)
        kids.append(Laurence)
        kids.append(Amanda)
        kids.append(Yun)
        kids.append(Zu)
        kids.append(Evan)
        kids.append(Edlyn)
        kids.append(Cheyenne)
        kids.append(Janine)
        kids.append(Gillian)
        kids.append(Aziel)
        kids.append(Elizabeth)
        kids.append(Zoe)
        kids.append(Liz)
        kids.append(Ziv)
        kids.append(Sarah)
        kids.append(Daniel)
        kids.append(Ryanne)
        kids.append(Vaness)
        kids.append(Renee)
        kids.append(Kaiser)
        kids.append(Lucas)
        kids.append(Esther)
        
        let centris83 = CCH078House(address: "83 JW Central 3, The Centris", mumContact: "81420638", dadContact: "", otherContact: "", latitude: 1.3393504, longitude: 103.7037953, kids: [DanicaDjokic])
        let centris77 = CCH078House(address: "77 JW Central 3, The Centris #05-29", mumContact: "93365741", dadContact: "", otherContact: "", latitude: 1.3393504, longitude: 103.7037953, kids: [JovinaLew])
        let centris67 = CCH078House(address: "67 JW Central 3, The Centris #05-07", mumContact: "97942659", dadContact: "93682700", otherContact: "", latitude: 1.3393504, longitude: 103.7037953, kids: [SheriseOng, SeiferOng, ShmuelOng])
        let jw698c = CCH078House(address: "Blk 698C JW Central 3 #12-75", mumContact: "81822256", dadContact: "", otherContact: "", latitude: 1.3411919, longitude: 103.7056901, kids: [XuZhiKai])
        let jw694 = CCH078House(address: "Blk 694 JW Central 1 #06-17", mumContact: "90621116", dadContact: "90074285", otherContact: "", latitude: 1.3433557, longitude: 103.7046495, kids: [WenXuan, WenBin])
        let jw680c = CCH078House(address: "Blk 680C JW Central 1 #03-48", mumContact: "82645286", dadContact: "", otherContact: "", latitude: 1.3451149, longitude: 103.7034314, kids: [Xuan, Jun])
        let jw681b1 = CCH078House(address: "Blk 681B JW Central 1 #02-68", mumContact: "94873126", dadContact: "98755141", otherContact: "97611120", latitude: 1.3448914, longitude: 103.7027177, kids: [Sophia, Amanda, Laurence])
        let jw681b2 = CCH078House(address: "Blk 681B JW Central 1 #04-72", mumContact: "81893778", dadContact: "", otherContact: "", latitude: 1.3448914, longitude: 103.7027177, kids: [Yun, Zu])
        let jw684c = CCH078House(address: "Blk 684C JW St 64 #14-133", mumContact: "", dadContact: "96722147", otherContact: "", latitude: 1.3436629, longitude: 103.7024067, kids: [Evan])
        let jw683b = CCH078House(address: "Blk 683B Jurong West #13-104", mumContact: "94367813", dadContact: "", otherContact: "90786339", latitude: 1.3429587, longitude: 103.702802, kids: [Edlyn])
        let jw685c = CCH078House(address: "Blk 685C JW Central 1 #09-168", mumContact: "91912987", dadContact: "94782840", otherContact: "67948024", latitude: 1.3425875, longitude: 103.701903, kids: [Cheyenne, Janine])
        let jw686a = CCH078House(address: "Blk 686A JW Central 1 #17-124", mumContact: "98476180", dadContact: "97428616", otherContact: "67948538", latitude: 1.3417684, longitude: 103.7025147, kids: [Gillian])
        let jw675b = CCH078House(address: "Blk 675B JW St 64 #02-229", mumContact: "97105497", dadContact: "", otherContact: "", latitude: 1.3458474, longitude: 103.7012973, kids: [Aziel, Elizabeth])
        let jw673c = CCH078House(address: "Blk 673C JW St 65 #03-40", mumContact: "91880718", dadContact: "", otherContact: "66107401", latitude: 1.3447304, longitude: 103.6990423, kids: [Zoe, Liz, Ziv])
        let jw673b = CCH078House(address: "Blk 673B JW St 65 #06-04", mumContact: "91789470", dadContact: "", otherContact: "67943698", latitude: 1.3444484, longitude: 103.6993673, kids: [Sarah, Daniel])
        let jw690 = CCH078House(address: "Blk 690 #06-209 JW Central 1", mumContact: "98412337", dadContact: "", otherContact: "67943698", latitude: 1.3412987, longitude: 103.7064266, kids: [Ryanne])
        let jw678B = CCH078House(address: "Blk 678B Jurong West Street 64 #08-321", mumContact: "97908282", dadContact: "", otherContact: "", latitude: 1.345387, longitude: 103.703828, kids: [Vaness, Renee, Kaiser])
        let jw674A = CCH078House(address: "Blk 674A #11-66 Jurong West St 65", mumContact: "97126823", dadContact: "", otherContact: "", latitude: 1.344858, longitude: 103.702201, kids: [Esther])
        let centris65 = CCH078House(address: "65 JW Central 3, The Centris #11-03", mumContact: "97155588", dadContact: "", otherContact: "", latitude: 1.3393504, longitude: 103.7037953, kids: [Lucas])

        
        houses.append(centris83)
        houses.append(centris77)
        houses.append(centris67)
        houses.append(centris65)
        houses.append(jw698c)
        houses.append(jw694)
        houses.append(jw680c)
        houses.append(jw681b1)
        houses.append(jw681b2)
        houses.append(jw684c)
        houses.append(jw683b)
        houses.append(jw685c)
        houses.append(jw686a)
        houses.append(jw675b)
        houses.append(jw673c)
        houses.append(jw673b)
        houses.append(jw690)
        houses.append(jw678B)
        houses.append(jw674A)
        
        kids = kids.sorted { (kid1, kid2) -> Bool in
            kid1.dobMonth < kid2.dobMonth
        }
        
//        var i = 1;
//        
//        while (i<13) {
//            let newArray = [CCH078Kid]()
//            birthdays.updateValue(newArray, forKey: i)
//            i += 1
//        }
//        
//        for kid in kids {
//            if let dobDate = kid.getDOBDate() {
//                var calendar = NSCalendar.current
//                calendar.locale = Locale(identifier: "en-US") as Locale!
//                let unitFlags = Set<Calendar.Component>([.month])
//                let components = calendar.dateComponents(unitFlags, from: dobDate)
//                let month = components.month
//                var array = birthdays[month!]
//                array?.append(kid)
//                birthdays.updateValue(array!, forKey: month!)
//            }
//        }
//        print(birthdays)
    }
    
    fileprivate func getAge(_ dob: String?) -> String {
        guard let dob = dob, dob.characters.count > 4, dob.contains("-") else {
            return ""
        }
        
        let dobStringArray = dob.components(separatedBy: "-")
        let yearString = dobStringArray.last
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        
        let age = year - Int(yearString!)!
        return "\(age)"
    }
    
}
