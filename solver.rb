#!/usr/bin/env ruby

letterset=ARGV[0].chars
if ARGV.length > 1
  MINSIZE=ARGV[1].to_i
else
  MINSIZE=3
end

letterset.map!(&:downcase)
letterset.map!(&:strip)

dictwords = IO.read('/usr/share/dict/words')

dictwords.each_line do |dictword|
  dictword.strip!
  if dictword.length > 6 or dictword.length < MINSIZE
    next
  end

  flag = true
  letterset.each do |let|
    dictword.each_char do |char|
      if not letterset.include?(char.downcase())
        flag = false
        break
      elsif letterset.count(char.downcase()) < dictword.count(char.downcase())
        flag = false
        break
      end
      break if flag == false
    end
  end
  puts dictword if flag
end
