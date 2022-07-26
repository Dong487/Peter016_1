//
//  HomeView.swift
//  Peter016_1
//
//  Created by DONG SHENG on 2022/7/22.
//

// 心裡測驗題目參考(抄襲)網址: https://www.beauty321.com/post/37525#p2

import SwiftUI

struct Questions: Hashable{
    let title: String
    let options: [Options]
}
struct Options: Hashable{
    let option: String
    let points: Int
}

class HomeViewModel: ObservableObject{
    
    @Published var data: [Questions] = []   // 題目(10題)
    @Published var number: Int = 1          // 現在的題數
    @Published var totalPoints: Int = 0     // 心理測驗的總分
    
    func fetchQuestions(){
        
        // 這邊也可以用來改接 後端獲取題目
        let data1 = Questions(title: "一天當中，通常什麼時候你的心情是最好的？", options: [Options(option: "早上", points: 2),Options(option: "下午及傍晚", points: 4),Options(option: "夜裡", points: 6)])
        let data2 = Questions(title: "你平常走路的速度？", options: [Options(option: "步伐很大、頻率較快", points: 6),Options(option: "步伐很小、頻率較快", points: 4),Options(option: "走得不快、頭往上看", points: 7),Options(option: "走得不快、頭往下看", points: 2),Options(option: "很慢～很慢～", points: 1)])
        let data3 = Questions(title: "和別人交談時，你的姿態通常是？", options: [Options(option: "雙手交疊站立", points: 4),Options(option: "雙手緊握", points: 2),Options(option: "一隻手或雙手放在臀部", points: 5),Options(option: "觸碰與你交談的對象", points: 7),Options(option: "不自覺摸耳朵、下巴或整理頭髮", points: 6)])
        let data4 = Questions(title: "睡覺之前，通常你在床上的姿勢為...", options: [Options(option: "仰躺、伸直", points: 7),Options(option: "俯躺、伸直", points: 6),Options(option: "側躺、微捲", points: 4),Options(option: "頭睡在一側手臂上", points: 2),Options(option: "被子蓋過頭", points: 1)])
        let data5 = Questions(title: "做夢時的你，常常遇見什麼？", options: [Options(option: "正在落下", points: 4),Options(option: "打架或掙扎", points: 2),Options(option: "找東西、找人", points: 3),Options(option: "正在飛或漂浮", points: 5),Options(option: "平常不太會做夢", points: 6),Options(option: "做的都是愉快的夢", points: 1)])
        let data6 = Questions(title: "當你坐著休息時，你的姿勢通常是？", options: [Options(option: "膝蓋併攏", points: 4),Options(option: "雙腿交叉", points: 6),Options(option: "雙腿伸直", points: 2),Options(option: "單腿盤在椅子上", points: 1)])
        let data7 = Questions(title: "你比較喜歡下列中的哪個顏色？", options: [Options(option: "紅色、橘色", points: 6),Options(option: "黑77的黑色", points: 7),Options(option: "黃色或是淺藍色", points: 5),Options(option: "綠色", points: 4),Options(option: "紫色or深藍色", points: 3),Options(option: "白色", points: 2),Options(option: "棕、灰色", points: 1)])
        let data8 = Questions(title: "當你專心在做某件事，但是被人打斷了，你會怎麼做？", options: [Options(option: "歡迎他，跟他對話", points: 6),Options(option: "非常厭惡、生氣！", points: 2),Options(option: "在上述兩者之間", points: 4)])
        let data9 = Questions(title: "當你出席公司派對或朋友聚會等場所，通常以什麼形式入場？", options: [Options(option: "很大聲入場，吸引大家注意", points: 6),Options(option: "安靜入場，找你認識的人", points: 4),Options(option: "極安靜入場，完全不引人注意", points: 2)])
        let data10 = Questions(title: "當你遇到開心的事情的時候，你的笑聲通常是？", options: [Options(option: "類似欣賞的大笑", points: 6),Options(option: "笑著、聲音不大", points: 4),Options(option: "輕聲呵呵笑", points: 3),Options(option: "羞怯的微笑", points: 5)])
    
        self.data.append(contentsOf: [data1,data2,data3,data4,data5,data6,data7,data8,data9,data10])
        
    }
    
    func result() -> (title:String ,description1:String){
        // 小於 20
        guard self.totalPoints >= 20  else {
            return ("較為膽小的內向者", "你屬於那內傾性格，為人比較內向，處事風格有些優柔寡斷，常常害怕犯錯誤，習慣自我反省，社交場所上會很害羞，最害怕麻煩，所以不喜歡參加不必要的活動，也不想認識沒有關係的人。情緒常常處在比較低落的狀態，常常以弟弟、妹妹自稱，希望得到別人的保護與支持。")
        }
        // 21-30分
        guard self.totalPoints >= 30  else {
            return ("缺乏信心的挑剔者", "你擁有近乎強迫症般的追求完美，有些類似於處女座。行事風格屬於謹慎小心型的，在一件事情沒有完全策劃好之前，你是不敢輕易去做的，這也反映了你缺乏自信心的表現，而且對於做事情的過程也很挑剔，不容許自己犯一點點的錯誤。")
        }
        // 31-40分
        guard self.totalPoints >= 40  else {
            return ("以牙還牙的自我保護者", "你的內心有著很強的控制欲望，有著對於周圍的生活環境一貫性理解的強烈需求，當環境有一點風吹草動，你就會非常的敏感。對待朋友非常的忠誠，而且你更渴望對方也能夠同樣的態度來重視你。你最接受不了的是好朋友在背後議論你，這樣會讓你傷心欲絕，並因此產生報復的心理。")
        }
        // 41-50分
        guard self.totalPoints >= 50  else {
            return ("平衡的調解者", "你的性格屬於中和性人格，為人有一定的謙遜姿態，但是同時有自己的主見，能夠理解他人，懂得照顧他人的感受，但同時不容許別人侵犯你。你有著很強的自我控制力，你下決心做的事情，一定會成功。很喜歡交朋友，人際關係處理的不錯，常常是朋友圈裡最值得信賴的人物。")
        }
        // 51-60分
        guard self.totalPoints >= 60  else {
            return ("吸引人的冒險家", "你的性格屬於愛冒險的人，通常大腦的思維非常活躍，喜歡嘗試新鮮的事情，行事風格偏重感性，只要自己覺得可行就會馬上去做，而且通常不計後果。但是往往結果會有很好的驚喜等著你，決策方面果敢而堅決，不會受他人的影響，愛情方面你總能給對方一些驚喜。")
        }
        // 60分以上
            return ("傲慢的孤獨者", "你的性格是桀驁的野心家，從骨子裡透出來的傲氣，揚在眉角自信，很像是天蠍座或獅子座。但是你的性格過於孤傲，行事風格以自我為中心，很難考慮到他人的感受，在朋友間常常會讓人不敢靠近。你的內心有很強的支配慾望與控制慾望，你希望能夠得到很大的權利。")
    }
    
    func reset(){
        self.data.removeAll()
        self.number = 1
        self.totalPoints = 0
        
        fetchQuestions()
    }
}

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {

            if viewModel.number == 11{
                ResultView
            } else {
                QuestionView
            }
        }
        .onAppear{
            viewModel.fetchQuestions()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView{
    
    // 做測驗時的View
    private var QuestionView: some View{
        ZStack {
            Image("Background1")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                ForEach(viewModel.data.indices ,id: \.self) { index in
                    VStack(spacing: 10){
                        if viewModel.number - 1 == index{
                            // 題目
                            Text(viewModel.data[index].title)
                                .font(.headline.bold())
                                .foregroundColor(.black)
                                .padding()
                                .shadow(color: .white.opacity(0.7), radius: 0.5, x: 1, y: 1)
                                .shadow(color: .white.opacity(0.5), radius: 1.5, x: 1.5, y: 1)
                                .shadow(color: .gray.opacity(0.5), radius: 0.5, x: 1, y: 1)
                                .shadow(color: .white.opacity(0.4), radius: 2, x: -1, y: -1)
                                .background(
                                    Image("Background2")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width + 100 , height: UIScreen.main.bounds.height / 4)
                                )
                                .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.height / 4)
                              
                            // 選項
                            ForEach(viewModel.data[index].options.indices ,id: \.self){ item in
                                
                                Button {
                                    viewModel.totalPoints += viewModel.data[index].options[item].points
                                    viewModel.number += 1 // 到下一題
                                } label: {
                                    Text(viewModel.data[index].options[item].option)
                                        .font(.body.bold())
                                        .foregroundColor(.white)
                                        .background(
                                            Image("OptionBackground")
                                                .resizable()
                                                .frame(width: UIScreen.main.bounds.width - 70, height: UIScreen.main.bounds.height / 15 - 5)
                                        )
                                        .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height / 15)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
    // 顯示 測驗結果 的View
    private var ResultView: some View{
        ZStack{
            Image("Background1")
                .resizable()
                .ignoresSafeArea()
            
            Image("ResultBackground")
                .resizable()
                .opacity(0.9)
                .frame(width: UIScreen.main.bounds.width + 80 , height: UIScreen.main.bounds.width + 80)
            
            Image("ResultImage")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2 , height: UIScreen.main.bounds.width / 2)
                .offset(y: -UIScreen.main.bounds.width / 2 - 40)
            
            // 如果用 Button 要注意 .offset 的使用
            Image("ResetButton")
                .resizable()
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                )
                .frame(width: UIScreen.main.bounds.width / 2 - 115 , height: UIScreen.main.bounds.width / 2 - 115)
                .offset(y: UIScreen.main.bounds.width / 2 - 30)
                .onTapGesture {
                    viewModel.reset()
                }
            
            VStack(spacing: 25){
                Text(viewModel.result().title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.7), radius: 0.5, x: 0.5, y: 0.5)
                    .shadow(color: .black.opacity(0.5), radius: 0.5, x: 1, y: 1)
                    .shadow(color: .black.opacity(0.3), radius: 1, x: 1.2, y: 1.2)
                    .shadow(color: .orange.opacity(0.4), radius: 2, x: -1, y: -1)
                    
                Text(viewModel.result().description1)
                    .font(.body.bold())
                    .foregroundColor(.black)
                    .shadow(color: .white.opacity(0.7), radius: 0.5, x: 1, y: 1)
                    .shadow(color: .white.opacity(0.5), radius: 1, x: 1.5, y: 1.5)
            }
            .frame(width: UIScreen.main.bounds.width - 90, height: UIScreen.main.bounds.width - 50)
        }
    }
}
