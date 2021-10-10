//
//  TestModel.swift
//  CollectionView-ScrollView
//
//  Created by dcl on 2021/10/10.
//

import Foundation


class TestModel {
    var category: String?
    var tasks: [Task]?
    var isAllComplete: Bool?
}



class Task {
    var name : String?
}


func getTestData() -> [TestModel] {
    var tms : [TestModel] = []
    
    // english
    var tm0 = TestModel()
    tm0.isAllComplete = false
    tm0.category = "英语"
    var t3 = Task()
    t3.name = "英语3"
    tm0.tasks = [t3, t3, t3, t3]
    tms.append(tm0)
    
    
    var tm1 = TestModel()
    tm1.isAllComplete = true
    tm1.category = "语文"
    var t0 = Task()
    t0.name = "语文0"
    tm1.tasks = [t0, t0, t0, t0]
    tms.append(tm1)
    
    var tm2 = TestModel()
    tm2.isAllComplete = false
    tm2.category = "养成习惯"
    var t1 = Task()
    t1.name = "养成习惯1"
    
    tm2.tasks = [t1, t1, t1, t1]
    tms.append(tm2)

    var tm3 = TestModel()
    tm3.isAllComplete = true
    tm3.category = "百科全书"
    var t2 = Task()
    t2.name = "百科全书2"
    tm3.tasks = [t2, t2, t2, t2]
    tms.append(tm3)

    var tm4 = TestModel()
    tm4.isAllComplete = false
    tm4.category = "Test"
    var tt = Task()
    tt.name = "TestModel TestModel"
    tm4.tasks = [tt, tt, tt, tt]
    tms.append(tm4)
    
    return tms
}
