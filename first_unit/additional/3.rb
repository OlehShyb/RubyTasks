def guess_number
  answer = Random.rand(1...100)
  attempts_number = 5
  while attempts_number > 0
    puts "Guess the number from 1 to 100.. You have 5 attempts"
    attempt = gets.to_i
    if attempt <= 100 and attempt >= 1
      if attempt == answer
        puts 'Amazing, your number is right!!!'
        break
      else
        attempts_number -= 1
        puts 'You did not guess the number. ' + attempts_number.to_s + ' attempts left..'
        if answer > attempt
          puts 'The answer is bigger'
        else
          puts 'The answer is smaller'
        end
      end
    else
      puts 'Your number is smaller than 1 or bigger than 100. Input it in right format..'
    end

  end
  puts 'Answer was ' + answer.to_s
end

puts 'Lets play game!'
guess_number