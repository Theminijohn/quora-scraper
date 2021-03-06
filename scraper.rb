require 'rubygems'
require 'ruby-progressbar'
require 'Nokogiri'
require 'csv'
require 'pry'

ENGAGEMENT_THRESHOLD = 4

# init progressbar
progressbar = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
                                  progress_mark:  ' ',
                                  remainder_mark: '･')

# parse file
doc = File.open("input.htm") { |x| Nokogiri::HTML(x) }
questions = doc.css('.TopicAllQuestionsList .pagedlist_item')

# identifiers
canonical_link = doc.at('link[rel="canonical"]')['href']
topic_name = canonical_link.match(/quora.com\/topic\/(.*)/)[1]

# update progressbar
progressbar.total = questions.count

# prepare csv
unless File.exist?('quora-data.csv')
  CSV.open("quora-data.csv", "w+") do |csv|
    csv << [
      "Topic", "Title", "Followers", "Answers", "Ratio", "Engagement potential",
      "Last action", "Parsed time", "Question link"
    ]
  end
end

questions.each do |q|
  link = "https://www.quora.com" + q.css('a.question_link').attr('href').value
  title = q.css('a.question_link').text.strip
  answer_count = q.css('.QuestionFooter .answer_count_prominent').text.strip.to_i
  follower_count = q.css('.FollowActionItem .ui_button_count .ui_button_count_inner').text.to_i
  ratio = "#{follower_count}/#{answer_count}"

  if answer_count == 0
    take_action = (follower_count >= ENGAGEMENT_THRESHOLD) ? "Yes" : "No"
  else
    take_action = ((follower_count / answer_count) >= ENGAGEMENT_THRESHOLD) ? "Yes" : "No"
  end

  # timestamps
  raw_time = q.css('.QuestionFooter .question_timestamp').text.strip
  last_action = raw_time.include?("Last requested") ? "Requested" : "Followed"

  if raw_time.include?('ago')
    if raw_time.scan(/(\d*)h/).flatten.any?
      hours_ago = raw_time.scan(/(\d*)h/).flatten[0].to_f
      parsed_time = (DateTime.now - (hours_ago / 24)).strftime('%Y-%m-%d')
    elsif raw_time.scan(/(\d*)m/).flatten.any?
      minutes_ago = raw_time.scan(/(\d*)m/).flatten[0].to_f
      parsed_time = (DateTime.now - (1.0 / 24 / 60)).strftime('%Y-%m-%d')
    end
  else
    if raw_time.count("0-9") > 0
      parsed_time = Date.parse(raw_time).strftime("%Y-%m-%d")
    else
      parsed_time =
        (Date.today < Date.parse(raw_time)) ? (Date.parse(raw_time) - 7) : Date.parse(raw_time)
    end
  end

  CSV.open("quora-data.csv", "a+") do |csv|
    csv << [
      topic_name, title, follower_count, answer_count, ratio,
      take_action, last_action, parsed_time, link
    ]
  end

  # move progressbar
  progressbar.increment
end
