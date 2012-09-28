require 'taip_parser'

describe TaipParser do
  it "returns an empty array for invalid formats" do
    TaipParser.parse("").should eq([])
  end

  it "parses valid formats" do
  	[
      [">RPV62317+3034424-0950853400000032;*7D<",         {type: "R", data: "PV", time_of_day: "62317", latitude: "+30.34424", longitude: "-095.08534", speed: 0, heading: 0, source: 3, age: 2, id: nil, checksum: "7D"}],
      [">RPV79000+3034433-0950850700000032;ID=1234;*74<", {type: "R", data: "PV", time_of_day: "79000", latitude: "+30.34433", longitude: "-095.08507", speed: 0, heading: 0, source: 3, age: 2, id: "1234", checksum: "74"}],
      [">RPV79004+3034433-0950850800034032;*78<",         {type: "R", data: "PV", time_of_day: "79004", latitude: "+30.34433", longitude: "-095.08508", speed: 0, heading: 340, source: 3, age: 2, id: nil, checksum: "78"}],
    ].each do |body, result|
     TaipParser.parse(body).should eq(result)
    end
  end
end