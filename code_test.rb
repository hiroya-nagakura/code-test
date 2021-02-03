# データの格納
time = []
distance = []
File.foreach("taxi.log"){|line|
  line = line.split(' ') # 半角で区切る
  time.push(line[0].split(':').map{|n| n.to_i}) #記録時間を時：分：秒で区切って格納
  distance.push(line[1].to_f/1000) # 距離（km）を格納
}
#計算
num = 1
while num < distance.length do
  ridetime = (time[num][0] - time[num-1][0])*3600 + (time[num][1] - time[num-1][1])*60 +(time[num][2] - time[num-1][2]) #乗車時間を秒で算出
  p distance[num]/(ridetime.to_f/3600)
  num += 1
end