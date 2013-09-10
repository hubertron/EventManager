require 'erb'

meaning_of_life = 42

question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life %>"
template = ERB.new question

results = template.result(binding)
puts results


# The code above loads the ERB library. Creates a new ERB template with the question string. The question string contains ERB tags that will show the results of the variable meaning_of_life. We send the result message to the template with binding