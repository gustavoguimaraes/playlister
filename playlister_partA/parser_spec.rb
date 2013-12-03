require './parser'

describe "#parser.rb" do 
	it "should take an array of strings and return an array of three strings" do  
		expect(Parser.new.parse_songs["A$AP Rocky-Peso [dance].mp3"]).to eq([["A$AP Rocky", "Peso", "dance"]] )
	end
end