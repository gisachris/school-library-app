module InputHandler
  def self.get_integer_input(prompt)
    print "#{prompt}:"
    gets.chomp.to_i
  end

  def self.get_string_input(prompt)
    print "#{prompt}:"
    gets.chomp.to_s
  end

  def self.get_boolean_input(prompt)
    print "#{prompt}:"
    answer = gets.chomp.downcase
    answer == 'y'
  end
end
