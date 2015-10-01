class IsoCountry

	attr_accessor :name, :alpha2, :alpha3, :continent
    
  def initialize(data={})
  	if data and !data.nil?
	    data.each do |k, v|
	      send("#{k}=", v) if self.respond_to? "#{k}="
	    end
	  end
  end

  class << self

  	def all
  		COUNTRIES[:alpha2].values
  	end

  	def find_by_name(name)
  		COUNTRIES[:name][name]
  	end
  	alias_method :name, :find_by_name

  	def find_by_alpha2(code)
  		COUNTRIES[:alpha2][code.to_s.upcase]
  	end
  	alias_method :alpha2, :find_by_alpha2

  	def find_by_alpha3(code)
  		COUNTRIES[:alpha3][code.to_s.upcase]
  	end
  	alias_method :alpha3, :find_by_alpha3

  end

end