ENV['RACK_ENV'] = 'test'
require 'bundler/setup'
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file}

RSpec.configure do |config|
  config.after(:each) do
    Quiz.all.each do |quiz|
      quiz.destroy
    end
    Question.all.each do |question|
      question.destroy
    end
    Answer.all.each do |answer|
      answer.destroy
    end
  end
end
