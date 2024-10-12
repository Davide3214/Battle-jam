function love.load()
    card1 = love.math.random(1, 2)
    card2 = love.math.random(1, 2)
    gameon = false
    game = 0
    End = false
    card_select = false
    love.window.setTitle("3 hour jam")
    love.window.setMode(700,700)
    font = love.graphics.newFont("SuperRugged.ttf", 50)
    love.graphics.setFont(font)
    Titlescreen = love.graphics.newImage("Sprites/Titlescreen.png")
    Black_knight_card = love.graphics.newImage("Sprites/Black_knight.png")
    Horse_card = love.graphics.newImage("Sprites/Horse.png")
    Start_sound = love.audio.newSource("Music_and_sound/Start.wav", "static")
    End_round = love.audio.newSource("Music_and_sound/Round_end.wav", "static")
    Background_music = love.audio.newSource("Music_and_sound/Background_music.mp3", "stream")
    Background_music:setLooping(true)
    love.audio.play(Background_music)
end

function love.keypressed(button)
    if button == "return" then
        if gameon == false then
            card_select = true
            gameon = true
            Start_sound:play()
        end
    elseif button == "1" then
        if card_select == true then
            card = card1
            card_select = false
            game = 1
        end
    elseif button == "2" then
        if card_select == true then
            card = card2
            card_select = false
            game = 1
        end
    end
    
end

function love.update(dt)
    
end

function love.draw()
    if gameon == false then
        love.graphics.draw(Titlescreen, 0, 0)
        love.graphics.print("Press START to play", 150, 350)
    elseif card_select == true then
        love.graphics.print("Choose a card", 200, 100)
        love.graphics.print("1", 282, 440)
        love.graphics.print("2", 382, 440)
        if card1 == 1 then
            love.graphics.draw(Black_knight_card, 260, 500)
        else
            love.graphics.draw(Horse_card, 260, 500)
        end

        if card2 == 1 then
            love.graphics.draw(Black_knight_card, 360, 500)
        else
            love.graphics.draw(Horse_card, 360, 500)
        end
    elseif game == 1 then
        if card == card1 then
            if card1 == 1 then
                love.graphics.print("You inflicted a damage of 3", 60, 250)
                love.graphics.print("The enemy inflicted you a damage", 0, 350)
                love.graphics.print("of 4", 350, 400)
                function love.keypressed(button)
                    if button == "return" then
                        game = 0
                        End = true
                    end
                end
                
                
            else
                love.graphics.print("You inflicted a damage of 2", 60, 250)
                love.graphics.print("The enemy inflicted you a damage", 0, 350)
                love.graphics.print("of 4", 350, 400)
                function love.keypressed(button)
                    if button == "return" then
                        game = 0
                        End = true
                    end
                end
            end
        elseif card == card2 then
            if card1 == 1 then
                love.graphics.print("You inflicted a damage of 3", 60, 250)
                love.graphics.print("The enemy inflicted you a damage", 0, 350)
                love.graphics.print("of 4", 350, 400)
                function love.keypressed(button)
                    if button == "return" then
                        game = 0
                        End = true
                    end
                end
            else
                love.graphics.print("You inflicted a damage of 2", 60, 250)
                love.graphics.print("The enemy inflicted you a damage", 0, 350)
                love.graphics.print("of 4", 350, 400)
                function love.keypressed(button)
                    if button == "return" then
                        game = 0
                        End = true
                    end
                end
            end
        end
    elseif End == true then
        love.graphics.print("You both died in the battle,",90,100)
        love.graphics.print("but the hero knew it was for a",50, 150)
        love.graphics.print("greather good",200 ,200)
        
    end
    
end