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
}



class Task {
    var name : String?
}


func getTestData() -> [TestModel] {
    var tms : [TestModel] = []
    
    // english
    var tm0 = TestModel()
    tm0.category = "英语"
    var t0 = Task()
    t0.name = "英语0"
    var t1 = Task()
    t1.name = "英语1"
    var t2 = Task()
    t2.name = "英语2"
    var t3 = Task()
    t3.name = "英语3"
    tm0.tasks = [t0, t1, t2, t3]
    
    var tm1 = TestModel()
    tm1.category = "语文"
    t0 = Task()
    t0.name = "语文0"
    t1 = Task()
    t1.name = "语文1"
    t2 = Task()
    t2.name = "语文2"
    t3 = Task()
    t3.name = "语文3"
    tm1.tasks = [t0, t1, t2, t3]
    
    var tm2 = TestModel()
    tm2.category = "养成习惯"
    t0 = Task()
    t1.name = "养成习惯0"
    t1 = Task()
    t2.name = "养成习惯1"
    t2 = Task()
    t2.name = "养成习惯2"
    t3 = Task()
    t3.name = "养成习惯3"
    tm2.tasks = [t0, t1, t2, t3]
    
    var tm3 = TestModel()
    tm3.category = "百科全书"
    t0 = Task()
    t0.name = "百科全书0"
    t1 = Task()
    t1.name = "百科全书1"
    t2 = Task()
    t2.name = "百科全书2"
    t3 = Task()
    t3.name = "百科全书3"
    tm3.tasks = [t0, t1, t2, t3]
    
    tms = [tm0, tm1, tm2, tm3]
    return tms
}
