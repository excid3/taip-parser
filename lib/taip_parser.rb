require "taip_parser/version"

module TaipParser
  RE = /^>(\w)(\w{2})(\d{5})(\+|-)(\d{2})(\d{5})(\+|-)(\d{3})(\d{5})(\d{3})(\d{3})(\d)(\d)(?:;ID=(\w+))?;\*(\w+)<$/

  def self.parse(body)
  	results = RE.match(body)

  	if results
      {
        type:        results.captures[0], # report
        data:        results.captures[1], # position velocity
        time_of_day: results.captures[2],

        latitude:    "#{results.captures[3]}#{results.captures[4]}.#{results.captures[5]}",
        longitude:   "#{results.captures[6]}#{results.captures[7]}.#{results.captures[8]}",

        speed:       results.captures[9].to_i, # 15 mph
        heading:     results.captures[10].to_i, # 126 degrees (approx SE)
        source:      results.captures[11].to_i, # source of data
        age:         results.captures[12].to_i, # age of data

        id:          results.captures[13], # ID of vehicle
        checksum:    results.captures[14], # Checksum
      }
    else
      {}
    end
  end
end
