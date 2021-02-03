# データの格納
time = []
distance = []
File.foreach("taxi.log"){|line|
  line = line.split(' ') # 半角で区切る
  time.push(line[0].split(':').map{|n| n.to_i}) #記録時間を時：分：秒で区切って格納
  distance.push(line[1].to_f) # 距離（km）を格納
}
#計算
num = 1
sum =0;
ans = 0;
while num < distance.length do
  ridetime = (time[num][0] - time[num-1][0])*3600 + (time[num][1] - time[num-1][1])*60 +(time[num][2] - time[num-1][2]) #乗車時間を秒で算出
  sum += distance[num] #距離を月山
  if (distance[num]/1000)/(ridetime.to_f/3600) <= 10 #時速10k以下の時の処理
    ans = ridetime/85 * 80
  end 
  num += 1
end
if sum < 1052
  ans = 420
else 
  ans= ans+420+((sum-1052)/233+1).to_i*80 #1052mになった時点で+80円になるよう計算
end
if time[0][0] >=22 || time[0][0] <=5
  ans*1.2
end
p "#{ans}円"

