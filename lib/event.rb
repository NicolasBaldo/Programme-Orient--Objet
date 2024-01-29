require 'pry'
require 'time'


class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  def end_date
    return 'Invalid start date' if @start_date.nil?

    end_time = @start_date + Rational(@duration, 24 * 60)
    end_time.strftime('%Y-%m-%d')
  end

  def postpone_24h
    @start_date += 24 * 60 * 60
  end

  def is_past?
    Time.now > @start_date
  end

  def is_future?
    !is_past?
  end

  def is_soon?
    start_time_in_minutes = (@start_date - Time.now) / 60
    start_time_in_minutes < 30
  end
  
  def to_s
    "Titre : #{@title}\nDate de début : #{@start_date.strftime('%Y-%m-%d %H:%M')}\nDurée : #{@duration} minutes\nInvités : #{@attendees.join(', ')}"
  end
end

class User
  attr_accessor :email, :age

  @@all_users = []

  def initialize(email, age)
    @email = email
    @age = age
    @@all_users << self
  end

  def self.all_users
    @@all_users
  end

  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end
end

class EventCreator
    def initialize
      create_event
    end
  
    def create_event
      puts "Salut, tu veux faire la bamboche ?!"
      print "Quel est le nom de l'événement ? "
      title = gets.chomp
  
      print "Quand aura-t-il lieu ? "
      start_date = gets.chomp
  
      print "Combien de temps va-t-il durer (en minutes) ? "
      duration = gets.chomp.to_i
  
      print "Génial. Qui va participer ? Balance leurs e-mails (séparés par des ;)"
      attendees = gets.chomp.split(';').map(&:strip)
  
      # Créer l'événement
      new_event = Event.new(start_date, duration, title, attendees)
  
      # Afficher les détails de l'événement créé
      puts "\nÉvénement créé avec succès :"
      puts new_event.to_s
    end
  end

binding.pry
puts "end of file"


#BAMBOCHE = Event.new("2024_12_12","5h","BAMBOCHE","Maxine,Gabriel,etc")
#Nicolas = User.new("nicolas@mail","31") 

#EventCreator.new




