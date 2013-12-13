module IsoCountry 

  class Country
    attr_accessor :name, :alpha2, :alpha3
    
    def initialize(data)
      data.each do |k, v|
        send(:"#{k}=", val) if self.respond_to? "#{k}="
      end
    end

  end

end