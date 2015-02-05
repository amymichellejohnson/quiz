require 'spec_helper'

describe Answer do

 it{should belong_to(:question)}

 it "validates the presence of an answer" do
   answer = Answer.new(answer: "")
   expect(answer.save).to eq(false)
 end

end
