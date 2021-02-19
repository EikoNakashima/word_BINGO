#ビンゴカードのサイズ
S = gets.to_i

#ビンゴカードの中身受け取り
bingo_card= Array.new(S){ gets.split }
word_list  = bingo_card.flatten

#入力される単語の量
N = gets.to_i

#入力された単語の受け取り
hit_words = Array.new(N){ gets.chomp }

#入力された単語がヒットしたらtrueをhit_listに追加
hit_list = Array.new(S*S)
hit_words.each do |hit|
  if ix = word_list.find_index(hit)
    hit_list[ix] = true
  end
end

#hit_listを二次元配列に変更
hit_card = hit_list.each_slice(S).to_a

#斜め判定
naname1 = Array.new(S){|i| hit_card[i][i] }.all?
naname2 = Array.new(S){|i| hit_card[i][-i-1] }.all?
# 横判定
yoko = hit_card.any?(&:all?)
# 縦判定
tate = hit_card.transpose.any?(&:all?)

# 結果出力
if yoko || tate || naname1 || naname2
  puts "yes"
else
  puts "no"
end
