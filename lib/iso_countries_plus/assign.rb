COUNTRY_HASH.each do |k, v|
	v.each do |name, hash|
		unless hash.nil?
			COUNTRIES[k][name] = IsoCountry.new(hash)
		end
	end
end