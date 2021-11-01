class Station
  attr_reader :name, :trains
  
  include InstanceCounter
  include Validation
  include ValidStation

  @@stations = []
  
  def self.all
    @@stations
  end
  
  def initialize(name)
    @station_name = name
    @trains = []
    @@stations.push(self)
    register_instance
    validate!
  end
  
  def add_train(train)
    @trains << train
  end
  
  def train_type(type)
    @trains.select{ |train| train.train_type == type }
  end

  def go_train(train)
    @trains.delete(train) if @trains.include?(train)
    puts "clickety clack"
  end

  def find_trains
    @trains.each { |train| yield(train)}
  end
  
  def trains_info
    find_trains do |train|
      puts "#{train.train_num}, #{train.train_type}"
    end
  end
end
