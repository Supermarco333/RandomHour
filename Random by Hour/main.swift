//
//  main.swift
//  Random by Hour


import Foundation

func maxHour() -> Int {
    var max:Int = 0
    for k in 0...2 {
        for l in 0...4 {
            for m in 0...5 {
                for n in 0...9 {
                    var somme = k+l+m+n
                    somme=k+l+m+n
                    if somme>max {
                        max=somme
                        print(k,l,m,n)
                    }
                }
            }
        }
    }
    return max
}

func triListe(list: [Int]) -> [Int] {
    var Lcopy = list
    for _ in 0...(list.count)-1 {
        for k in 0...(list.count)-2 {
            if Lcopy[k]>Lcopy[k+1] {
                (Lcopy[k],Lcopy[k+1])=(Lcopy[k+1],Lcopy[k])
            }
        }
    }
    return Lcopy
}

func combHour() -> [Int] {
    var list = [Int]()
    for k in 0...2 {
        for l in 0...4 {
            for m in 0...5 {
                for n in 0...9 {
                    list.append(k+l+m+n)
                    
                }
            }
        }
    }
    return list
}

func countType(L: [Int]) -> Int {
    var count: Int = 1
    for k in 0...L.count-2 {
        if L[k] != L[k+1] {
            count+=1
        }
    }
    return count
}

func createDic(list: [Int]) -> [Int:Int] {
    var dict = [Int:Int]()
    dict[list[0]]=0
    for k in 1...list.count-1 {
        if list[k] != list[k-1] {
            dict[list[k]]=0
        }
    }
    return dict
}

func fillDict(dict: [Int:Int], hour: [Int]) -> [Int:Int] {
    var dictCopy = dict
    for value in hour {
        dictCopy[value]!+=1
    }
    return dictCopy
}

func isEqual(n: Int, dict: [Int:Int]) -> [Int:Int] {
    var players = [Int:Int]()
    for k in 0...n-1 {
        players[k]=0
    }
    for (key,value) in dict {
        players[key%n]!+=value
    }
    players[n]=players[0]
    players.removeValue(forKey: 0)
    return players
}

func meanDeviation(list: [Int:Int]) -> Int {
    var mean: Int = 0
    var count: Int = 0
    var meanDev: Int = 0
    for (_,value) in list {
        mean+=value
        count+=1
    }
    mean/=count
    for (_,value) in list {
        meanDev+=abs(value-mean)
    }
    meanDev/=count
    return meanDev
}

func results(n: Int) {
    let hourList = triListe(list: combHour())
    let dict = fillDict(dict: createDic(list: hourList), hour: hourList)
    for k in 1...n {
        print(k, "joueurs: ", isEqual(n: k, dict: dict).sorted(by: <))
    }
    for k in 1...n {
        let result = isEqual(n: k, dict: dict)
        print(k, "joueurs: mean deviation =", meanDeviation(list: result))
    }
}

results(n: 20)

/* results() function should not be used over 20 as 20 is the maximuml we can get with all the different hour combinations */
