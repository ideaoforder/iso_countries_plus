ISO_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'countrynames.txt'))	
ADDITIONS_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'additions.yml'))
CONTINENTS_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'country_continents.csv'))
COUNTRY_HASH = {:name => {}, :alpha2 => {}, :alpha3 => {}, :guess => []}
COUNTRIES = {:name => {}, :alpha2 => {}, :alpha3 => {}, :guess => []}

# We download the file from here:
# http://opengeocode.org/download/countrynames.txt

# Example entry
# AF; AFG; 4; Afghanistan; Afghanistan; Afghanistan; Afghanistan; Afghanistan; Afghanistan; Afganistán; the Islamic Republic of Afghanistan; République islamique d'Afghanistan; República Islámica del Afganistán (la); Афганистан; Исламская Республика Афганистан; Afghā̄nestā̄n[fa]/Afghā̄nistān[ps]; Jomhūrī-ye Eslā̄mī̄-ye Afghā̄nestā̄n[fa]/Afghānistān Islāmī Jumhūrīyat[ps]; Afghanistan; Afghanistan; la Repubblica islamica dell'Afghanistan; Afghanistan; Afghanistan; Islamic Republic of Afghanistan; Afghanestan; Jomhuri-ye Eslami-ye Afghanestan; Afghanistan; Afghanistan; Islamic Republic of Afghanistan
CSV.foreach(ISO_FILE, :col_sep => ";") do |row|
	alpha2 = row[0].strip
	alpha3 = row[1].strip
	official_name = row[3].strip

	# We set the 2- and 3-digit keys to use the first (official) name
	COUNTRY_HASH[:alpha2][alpha2] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
	COUNTRY_HASH[:alpha3][alpha3] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}

	# Then we create an entry for each additional country name
	for i in 3...row.length
		unless (row[i].nil? or row[i] == '')
			# NOTE: We still set the name to our official name
			cname = row[i].strip.force_encoding("UTF-8")
			COUNTRY_HASH[:name][cname] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
			COUNTRY_HASH[:name][cname.downcase] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}

			# Check for "and", and grab both country names, to be more exhaustive
			if cname =~ /\sand\s/
				narray = cname.split(/\s*,\s*and\s+|\s*,\s*|\s+and\s+/)
				for name in narray
					COUNTRY_HASH[:name][name] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
					COUNTRY_HASH[:name][name.downcase] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
					COUNTRY_HASH[:guess] << name

					if narray.last[/islands?/i]
						iname = name.gsub(/islands?/i, '').strip + ' Island'
						COUNTRY_HASH[:name][iname] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
						COUNTRY_HASH[:name][iname.downcase] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
						COUNTRY_HASH[:guess] << iname

						# grab the plural too
						iname += 's'
						COUNTRY_HASH[:name][iname] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
						COUNTRY_HASH[:name][iname.downcase] = {:name => official_name, :alpha3 => alpha3, :alpha2 => alpha2}
						COUNTRY_HASH[:guess] << iname
					end
				end
			end

		end
	end

end

COUNTRY_HASH[:guess].uniq!

# We keep a list of countries that come up a lot but aren't included in countrynames.txt
additions = YAML.load_file(ADDITIONS_FILE)
additions.each do |name, code|
	COUNTRY_HASH[:name][name] = COUNTRY_HASH[:alpha2][code]
	COUNTRY_HASH[:name][name.downcase] = COUNTRY_HASH[:alpha2][code]
end

CSV.foreach(CONTINENTS_FILE, :col_sep => ",") do |row|
	if COUNTRY_HASH[:alpha2][row[0]] and row[1] != '--'
		COUNTRY_HASH[:alpha2][row[0]].merge!(:continent => row[0])
	end
end