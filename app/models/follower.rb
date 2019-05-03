class Follower
  attr_accessor :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def my_bloodoaths
    BloodOath.all.select do |bo|
      bo.follower == self
    end
  end

  def cults
    my_bloodoaths.map do |bo|
      bo.cult
    end
  end

  def join_cult(cult, initiation_date)
    if self.age < cult.minimum_age
      puts "You're too young!"
    else
      BloodOath.new(initiation_date, self, cult)
    end
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age
    end
  end

  def my_cults_slogans
    cults.each do |cult|
      puts cult.slogan
    end
  end

  def self.most_active
    cults_amount = 0
    most_cults_person = nil
    self.all.each do |follower|
      if follower.cults.length > cults_amount
        cults_amount = follower.cults.length
        most_cults_person = follower
      end
    end
    most_cults_person
  end

  def fellow_cult_members
    followers = self.cults.map { |cult| cult.followers}.flatten
    followers.delete_if do |follower|
      follower == self
    end
  end

  def self.top_ten
    new_hash = {}
    self.all.map do |follower|
      new_hash[follower] = follower.cults.length
    end
    new_hash.sort_by {|follower, cult_num| cult_num}.to_h.keys.last(10)
  end


end
