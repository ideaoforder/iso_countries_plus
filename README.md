# IsoCountriesPlus

This gem differs from other ISO country gems in that it allows VERY flexible name lookups by cross-compiling additional country name standards, so country names like 'South Korea' and 'Russia' will work properly. It uses a file compiled by OpenGeocode.org consisting of the ISO 3166-1 country names (including foreign variants) and codes, as well as the U.S. Board on Geographic Names (BGN), United Nations Group of Experts on Geographic Names (UNGEGN), and U.K. Permanent Committee on Geographic Names (PCGN) country names. More info here: http://opengeocode.org/download.php#countrynames

Additionally, a country's continent was added in version 0.2.0.

File downloadable here: http://opengeocode.org/download/countrynames.txt

Developed by [Whiplash Merchandising](http://whiplash.io/)

## Installation

Add this line to your application's Gemfile:

    gem 'iso_countries_plus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso_countries_plus

## Usage
```ruby
IsoCountry.all

IsoCountry.find_by_name("Russia")
IsoCountry.find_by_alpha2("RU")
IsoCountry.find_by_alpha2("RUS")

country = IsoCountry.find_by_name("South Korea")
country.alpha2 # KR
country.alpha3 # KOR
country.name # Korea, Republic of
country.continent # AS
```

## Features
Combined countries like 'Bosnia and Herzegovina' will also be accessible individually as 'Bosnia' and 'Herzegovina'.

Grouped islands like Pitcairn, Henderson, Ducie, and Oeno Islands will also be accessible as (for example) "Pitcairn", "Ducie Island", and "Oeno Islands" (i.e the name with and without the "Island" and 
"Islands" suffixes).

Country names are also stored in lowercase. This is useful for allowing more flexibility for user input or when values are entered as all caps.

For example:
```ruby
country = "GERMANY"
IsoCountry.find_by_name(country.downcase)
```
## Adding Countries
Additional countries are listed in additions.yml as key-value pairs.
```yaml
'USA': US
'UK': GB
'Great Britain': GB
'England': GB
'Scotland': GB
'Wales': GB
'Northern Ireland': GB
```

Feel free to fork the gem and add more, or message me with other additions.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
