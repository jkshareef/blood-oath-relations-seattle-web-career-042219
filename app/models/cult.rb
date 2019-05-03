class Cult

  attr_accessor :name, :location, :founding_year, :slogan, :minimum_age

  @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower, initiation_date)
    if follower.age < @minimum_age
      puts "You're too young"
    else
      BloodOath.new(initiation_date, follower, self)
    end
  end

  def bloodoaths_to_cult
    BloodOath.all.select do |bo|
      bo.cult == self
    end
  end

  def followers
    bloodoaths_to_cult.map do |bo|
      bo.follower
    end
  end

  def cult_population
    if !BloodOath.all.any? {|bo| bo.cult == self}
      0
    else
      BloodOath.all.select do |bloodoath|
        bloodoath.cult == self
      end.length
    end
  end

  def self.find_by_name(name)
    self.all.find do |cult|
      cult.name == name
    end
  end

  def self.find_by_location(location)
    Cult.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year(year)
    Cult.all.select do |cult|
      cult.founding_year == year
    end
  end

  def average_age
    followers.map {|follower| follower.age.to_f}.sum/followers.length
  end

  def my_followers_mottos
    followers.each do |follower|
      puts follower.life_motto
    end
  end

  def self.least_popular
    least_popular = nil
    population = nil
    self.all.each do |cult|
      if !population
        population = cult.cult_population
      elsif cult.cult_population < population
        population = cult.cult_population
        least_popular = cult
      end
    end
    least_popular
  end

  def self.most_common_location
    locations = self.all.map do |cult|
      cult.location
    end
    locations.max { |location| location.count(location)}
  end

end
