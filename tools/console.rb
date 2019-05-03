require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

jamal = Follower.new('Jamal Shareef', 33, 'I play for keeps')
rachel = Follower.new('Rachel Williams', 20, 'I can dig it')
bob = Follower.new("Bob", 15, "I'm young")
dreadwyrm = Cult.new('Dreadwyrm', 'Portland', 1982, 'In fire we are born', 18)
obsidian = Cult.new('Obsidian Annex', "Modesto", 1982, 'We meet at dawn', 18)
redmoon = Cult.new('Red Moon Clan', 'Portland', 1864, 'The planning time, she comes', 16)

bo1 = dreadwyrm.recruit_follower(rachel, "2019-05-02")
bo2 = obsidian.recruit_follower(jamal, "2019-05-01")
bo3 = obsidian.recruit_follower(rachel, "2019-05-01")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
