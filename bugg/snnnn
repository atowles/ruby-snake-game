#!/usr/bin/ruby
require 'ruby2d'
set width: 1500, height: 768, title: "Hello Ruby", background: "#00002b", resizable:true
# Define a square shape.
Line.new(
  x1: 0, y1: 0,
  x2: 0, y2: 1700,
  width: 30,
  color: 'green'
)
Line.new(
  x1: 0, y1: 0,
  x2: 1700, y2: 0,
  width: 30,
  color: 'green'
)
Line.new(
  x1: 1500, y1:0,
  x2: 1500, y2: 768,
  width: 30,
  color: 'green'
)
Line.new(
  x1: 0, y1: 768,
  x2: 1500, y2: 768,
  width: 30,
  color: 'green'
)
=begin
Line.new(
  x1: 125, y1: 100,
  x2: 350, y2: 400,
  width: 25,
  color: 'lime',
  z: 20
)
=end
@grsp = 0.3
@ghost_speedx = 0
@ghost_speedy = 0
if ARGV.include?("muly")
  @mul = true
  puts "2 players"
elsif ARGV.include?("muln")
  @mul = false
  puts "1 player"
end
if ARGV.include?("0")
  @grsz = 1
elsif ARGV.include?("1")
  @grsz = 8
end
if ARGV.include?("2")
  @grsp = 0.3
elsif ARGV.include?("3")
  @grsp = 1
end
$mulyn = ARGV.include?("muly")
puts ARGV
if ARGV.include?("bigger")
  Thread.new {
    while true do
      sleep 1.5
      @square.width += @grsz
      @square.height += @grsz
      puts @square.width
      if ARGV.include?("muly")
      @square2.width += @grsz
      @square2.height += @grsz
      end
      end
  }
elsif ARGV.include?("smaller")
  Thread.new {
    while true do
      sleep 2.5
      if @square.width < 2
        break
      end
      @square.width -= @grsz
      @square.height -= @grsz
      @square2.width -= @grsz
      @square2.height -= @grsz
    end
  }
end
@mainspeed = 4
if ARGV.include?("faster")
  Thread.new {
    while true do
      sleep 5
      @mainspeed += @grsp
      if @mainspeed == 20
        break
      end
    end
  }
elsif ARGV.include?("slower")
  Thread.new {
    while true do
      sleep 5
      @mainspeed -= @grsp
      if @mainspeed == 0.3
        break
      end
    end
  }
end

$score = 0
$score2 = nil
@scoreL = Text.new("Score: #{$score}", x:20, y: 20, color: 'green')
@square = Sprite.new("./pacY.png",x: 30, y: 30, width: 15, height: 15, clip_width: 33, time: 100, loop: true)
@square.play
#@square.x = 40
if ARGV.include?("muly")
  $score2 = 0
  @scoreL2 = Text.new("Score: #{$score2}", x: 200, y: 20, color: 'green')
  @square2 = Sprite.new("./pacW.png", x: get(:width) - 45, y: 30, width: 15, height: 15, rotate: 180, clip_width: 33, time: 100, loop: true)
  @square2.play
  @x_speed2 = 0
  @y_speed2 = 0
  $blocksx2 = Array.new
  $blocksy2 = Array.new
  def check_dead2(sc22, blx2, bly2)
    xpos2 = (@square2.x..(@square2.x + @square2.width))
    ypos2 = (@square2.y..(@square2.y + @square2.width))
    broke2 = false
    (0..blx2.length).each {
      |varx2|
          if xpos2.include?(blx2[varx2].to_i)
            if ypos2.include?(bly2[varx2].to_i)

            clear
            @x_speed2 = 0
            @y_speed2 = 0
            puts "Check Dead"
            puts "Score: #{sc22}"
	  if ARGV.include?("bigger") && ARGV.include?("1")
		game_over("Wrong_Settings", "Wrong_Settings", "C")
                exit 0
	  else
            game_over($score, $score2 - 3, "C")
            exit 0
          end
            end


        end

    }
  end
else
  @square2 = Sprite.new('./pacW.png', x: 10000, y: 10000, size: 15, color: 'blue')
end
@ghost = Square.new(x: 10000, y: 10000, size: 15, color: 'purple')
# Define the initial speed (and direction).
@x_speed = 0
@y_speed = 0
@x_speed2 = 0
@y_speed2 = 0
#puts get(:height)
$blocksx = Array.new
$blocksy = Array.new
#$blocks2 = {}
def new_block
  xW = rand(get(:width))
  until xW % 15 == 0 && !(xW..(xW+30)).include?(@square.x) && !(xW..(xW-30)).include?(@square.x)
    xW = rand(get(:width))
  end
  yW = rand(get(:height))
  until yW % 15 == 0 && !(yW..(yW+30)).include?(@square.y) && !(yW..(yW-30)).include?(@square.y)
    yW = rand(get(:height))
  end
  $blocksx.push xW.to_s
  $blocksy.push yW.to_s
  Square.new(x: xW, y: yW, size: 15, color: 'green')
end
#30.times { new_block}





def game_over(sc, sc2 = nil, res)
  #puts "You Lose! $score: #{sc}"
  clear
  puts "Score: #{sc}"
  @x_speed = 0
  @y_speed = 0
  @x_speed2 = 0
  @y_speed2 = 0
  system "./score.rb #{sc} #{res} #{sc2} &"
  exit 0
end







def check_dead(sc2, blx, bly)
  xpos = (@square.x..(@square.x + @square.width))
  ypos = (@square.y..(@square.y + @square.width))
  broke2 = false
  (0..blx.length).each {
    |varx|
#    varx15 = varx.to_i + 15

 
#      vary15 = vary.to_i + 15

        if xpos.include?(blx[varx].to_i)
          if ypos.include?(bly[varx].to_i)
          
          clear
          @x_speed = 0
          @y_speed = 0
          puts "Check Dead"
          puts "Score: #{sc2}"
	if ARGV.include?("bigger") && ARGV.include?("1")
		game_over("Wrong_Settings", "Wrong_Settings", "C")
                exit 0
	else
          game_over($score - 3, $score2, "C")
          exit 0
        end
          end	
	
      end
      
  }
end
def check_eat(appleN, sc3)
  broke = false
  xSS = @square.x
  #xSS2 = @square2.x
  xSZ = xSS + @square.width
  #xSZ2 = xSS2 + @square2.width
  ySS = @square.y
  #ySS2 = @square2.y
  ySZ = ySS + @square.width
  #ySZ2 = ySS2 + @square2.width
  if $mulyn
    xSS2 = @square2.x
    xSZ2 = xSS2 + @square2.width
    ySS2 = @square2.y
    ySZ2 = ySS2 + @square2.width
  end
  x15 = appleN.x + 15
  y15 = appleN.y + 15
  (appleN.x..x15).each { |xsss|
    if (xSS..xSZ).include?(xsss)
      (appleN.y..y15).each { |ysss|
        if (ySS..ySZ).include?(ysss)
          puts xsss, ysss
          puts xSS, ysss
          new_apple appleN
          $score += 1
          @scoreL.text = "Score: #{$score}"
          broke = true
          break
        end
      }
    end
    if broke
      break
    end
    if $mulyn
    if (xSS2..xSZ2).include?(xsss)
      (appleN.y..y15).each { |ysss|
        if (ySS2..ySZ2).include?(ysss)
          new_apple appleN
          $score2 += 1
          @scoreL2.text = "Score: #{$score2}"
          broke = true
          break
        end
      }
    end
    end
    if broke
      break
    end
  }
end
apple = Square.new(x: get(:width)/2, y: get(:height)/2, size: 15, color: 'red')
def new_apple appleVar
  xA = rand(get(:width)/15) * 15
  if xA < 30
    xA += 30
  end
  yA = rand(get(:height)/15) * 15
  if yA < 30
    yA += 30
  end
  if yA > get(:height) - 30
    yA -= 30
  end
  if xA > get(:width) - 30
    xA -= 30
  end
  appleVar.x = xA
  appleVar.y = yA
end

# Define what happens when a specific key is pressed.
# Each keypress influences on the  movement along the x and y axis.
on :key_down do |event|
  if event.key == 'left'
=begin
  while @square.x % 15 != 0 && @square.y % 15 != 0
      update do 
        @square.x += @x_speed
        @square.y += @y_speedend
      end
=end

    @x_speed = -@mainspeed
    @y_speed = 0
    @square.rotate = 180

#    new_block
#=end
#    @square.x -= 15
  elsif event.key == 'w'
    @x_speed2 = 0
    @y_speed2 = -@mainspeed
    @square2.rotate = 270
  elsif event.key == 'a'
    @x_speed2 = -@mainspeed
    @y_speed2 = 0
    @square2.rotate = 180
  elsif event.key == 's'
    @x_speed2 = 0
    @y_speed2 = @mainspeed
    @square2.rotate = 90
  elsif event.key == 'd'
    @x_speed2 = @mainspeed
    @y_speed2 = 0
    @square2.rotate = 0
  elsif event.key == 'escape'
    game_over($score, $score2, "G")
    exit 0
  elsif event.key == 'right'
=begin    while @square.x % 15 != 0 && @square.y % 15 != 0
      update do
        @square.x += @x_speed
        @square.y += @y_speed
      end
=end

    @x_speed = @mainspeed
    @y_speed = 0
    @square.rotate = 0

#    new_block
#=end
=begin    until event.key != 'right'
      update do
        @square.x += 15
      end
      sleep 0.5
=end
  elsif event.key == 'up'

    @x_speed = 0
    @y_speed = -@mainspeed
    @square.rotate = 270
    
#    new_block
    #@square.y -= 15
  elsif event.key == 'down'

    @x_speed = 0
    @y_speed = @mainspeed
    @square.rotate = 90
#    new_block
    #@square.y += 15
  elsif event.key == "space"
    @x_speed = 0
    @y_speed = 0
#    new_block
  end 
end

Thread.new {
  while true do
    sleep 0.075
 #   puts @square.x
 #   puts @square.y
    if @square.x < 0 || @square.x > get(:width) || @square.y < 0 || @square.y > get(:height)
      puts "#{@square.x}:#{@square.y}"
      puts "out of bounds"
      if ARGV.include?("bigger") && ARGV.include?("1")
        game_over("Wrong_Settings", nil, "O")
      elsif ARGV.include?("muly")
        game_over($score - 3, $score2, "O")
      else
        game_over($score, nil, "O")
      end
    end
  end
}
if ARGV.include?("muly")
  Thread.new { 
    while true do
      sleep 0.075
      if @square2.x < 0 || @square2.x > get(:width) || @square2.y < 0 || @square2.y > get(:height)
       puts ARGV
       puts "ARGV\n\n\n\n\n"
        if ARGV.include?("bigger") && ARGV.include?("1")
          game_over("Wrong_Settings", "Wrong_Settings", "O")
          puts "aack"
        elsif ARGV.include?("muly")
          game_over($score, $score2 - 3, "O")
        else
          game_over($score, nil, "O")
        end
      end
    end
  }
end
$cheT = Thread.new {
  while true do
    sleep 0.0008
    check_dead($score, $blocksx, $blocksy)
  end 
}
 
def che
  $cheT = Thread.new {
    while true do
      sleep 0.0008
      check_dead($score, $blocksx, $blocksy)
    end
  }
end
if ARGV.include?("bigger") && ARGV.include?("1")
  puts "Nope"
else
Thread.new {
  while true do
    sleep 2.5
    $cheT.terminate
    new_block
    che
  end
}
end
$cheT2 = Thread.new {
   while true do
     sleep 0.0008
     check_dead2($score2, $blocksx, $blocksy)
     
   end
}

Thread.new {
  while true do
    check_eat(apple, $score)
    sleep 0.0008
   end
}

update do
  @square.x += @x_speed
  @square.y += @y_speed
  @square2.x += @x_speed2
  @square2.y += @y_speed2
  @ghost.x += @ghost_speedx
  @ghost.y += @ghost_speedy
end

show
