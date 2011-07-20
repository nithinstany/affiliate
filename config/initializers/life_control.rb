module LifeControl

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
    end


  module ClassMethods
    def alive
      where("commissions > ?", 0.00)
    end
  end


  module InstanceMethods

    def test
      puts "pppppppppppppppppp"
    end
  end





end

