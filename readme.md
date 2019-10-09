# Quora Questions Scraper

🔥 I'm launching a Quora Marketing Tool soon, if you'd like to be notified [let me know here](https://forms.gle/6xDTyjCM6mj8TbPK7) (No Spam, pinky-promise) 🔥

> USE AT YOUR OWN DISCRETION. THIS PROJECT IS INTENDED FOR.. EDUCATIONAL PURPOSES ONLY. COUGH. SCRAPE RESPONSIBLY

### What is Quora?
I'm glad you asked, behind-a-rock-living-species. Quora is a question-and-answer platform where questions are asked, answered, edited, and organized by its community of users in the form of opinions.

### Why should I focus on Quora?
- You build your email list fast.
- You establish thought leadership.
- Your posts get many organic views.
- Your traffic compounds as you gain followers.
- You can drive thousands of more members to your online community.
- Excellent posts get syndicated to major publications, including Time and Inc. Magazine.
- Quora is gaining traction in Google’s SEO landscape

### Ok, but how does this work?
This script focuses on the top funnel for this Quora Strategy: **identifying the right questions 100x  faster**

Knowing how to write quality answers is important, but if you spend thirty minutes looking for a quality question, then you’ll never get traction. You need to understand what questions you should answer and how to find them.. **faster**.

Before you begin jumping into these topics and bookmarking every question that pulls your attention, know the attributes that make a question ripe for traction:

- (5-7):1 ratio of followers to the number of answers provided.
- A lot of followers, but many bad answers.
- A question that you can provide a personal image to complement.
- An emotional pull. This pull makes it easier to write more genuine answers with thought-provoking stories.
- Relevant to your bio offer.
- A question with poor-written answers making yours more likely to stand out.

The fastest way to identify a poorly-written answer is to look at whether the writer focuses on self-promotion rather than providing value.

For example, in the question below, the top answer has a promotional link in the first sentence and provides little value to the reader. Moreover, there’s a 7:1 ratio of followers to answers.

Jackpot!

### Lets get started!

Bare with me, young padawan. If you're not at least a _bit_ technical this may seem daunting, but it isn't. Pinky-promise..

- Install Ruby
  - You are on Windows -> https://rubyinstaller.org/
  - You are on MacOS -> http://railsapps.github.io/installrubyonrails-mac.html

- Install the required Libraries
  - `gem install ruby-progressbar`
  - `gem install nokogiri`

Thats it. Clone this repo:

- Open your terminal of choice
  - My choice for mac -> https://www.iterm2.com/
- Navigate to where you want to download this repository (`cd /some-folder/`)

enter
```
git clone git@github.com:Theminijohn/quora-scraper.git
```

Voilà. The hardest part is done.

### Ok, NOW Lets get started!

Open your browser and navigate to a topic you want to scrape. Make sure you select **All Questions** from the options dropdown

![](https://i.imgur.com/aHOrvxF.png)

Either scroll by hand until you have a satisfactory amount of questions loaded on the page or use an auto-scroll plugin like [Auto Scroll Chrome Plugin](https://chrome.google.com/webstore/detail/autoscroll/occjjkgifpmdgodlplnacmkejpdionan?hl=en)

Hit `cmd` + `s` / `ctrl` + `s` to save the html output of the page. This will save a `.htm` file and a folder in your Downloads directory

You can delete the folder, we're only concerned about the `.htm` file. Move this file into the folder where the `scrape.rb` file lives (you downloaded it previously into a directory).

Open your terminal, navigate to the folder where the script and the `.htm` file is and type

```
ruby scrape.rb
```

This will output a `quora-data.csv` file into the same directory.

You can repeat these steps for multiple topics, the script will keep appending data.

The `quora-data.csv` file contains this data:

- Topic
  > The Topic slug, as its used in the url on quora (https://www.quora.com/topic/{topic_slug})
- Title
  > The title of the question
- Followers
  > #of people that follow this question
- Answers
  > #of answers given
- Ratio
  > Follower to Answers ratio
- Engagement potential
  > Ratio is above a specified threshold. This is defined via `ENGAGEMENT_THRESHOLD` on line 7. I Believe that 5 is a good starting point, if you feel like changing this, thats where you would need to do it.
- Last action
  > Quora provides timestamps for Last Requested & Last Followed
- Parsed time
  > When the last action was performed (YYY-MM-DD)
- Question link
  > The canonical url for the question



Head of Example Scrape
```
+-------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------+---------+--------+----------------------+-------------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                   Topic                   |                                                                                                                           Title                                                                                                                           | Followers | Answers | Ratio  | Engagement potential | Last action | Parsed time |                                                                                                              Question link                                                                                                              |
+-------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------+---------+--------+----------------------+-------------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Visiting-and-Travel-in-the-United-Kingdom | Would the government know if you went into the UK with a child then came back in with the same child without officially leaving?                                                                                                                          |         1 |       1 | 1/1    | No                   | Requested   | 2018-09-08  | https://www.quora.com/Would-the-government-know-if-you-went-into-the-UK-with-a-child-then-came-back-in-with-the-same-child-without-officially-leaving                                                                                   |
| Visiting-and-Travel-in-the-United-Kingdom | What are the alleged no-go areas in England?                                                                                                                                                                                                              |        36 |      87 | 36/87  | No                   | Followed    | 2018-09-06  | https://www.quora.com/What-are-the-alleged-no-go-areas-in-England                                                                                                                                                                       |
| Visiting-and-Travel-in-the-United-Kingdom | Why have you decided to never visit the United Kingdom ever again?                                                                                                                                                                                        |        10 |       0 | 10/0   | Yes                  | Followed    | 2018-09-05  | https://www.quora.com/unanswered/Why-have-you-decided-to-never-visit-the-United-Kingdom-ever-again                                                                                                                                      |
| Visiting-and-Travel-in-the-United-Kingdom | What is your biggest cultural shock from visiting the UK?                                                                                                                                                                                                 |         2 |       5 | 2/5    | No                   | Followed    | 2018-09-04  | https://www.quora.com/What-is-your-biggest-cultural-shock-from-visiting-the-UK                                                                                                                                                          |
| Visiting-and-Travel-in-the-United-Kingdom | What should I never do or say in Britain?                                                                                                                                                                                                                 |        74 |     112 | 74/112 | No                   | Followed    | 2018-09-01  | https://www.quora.com/What-should-I-never-do-or-say-in-Britain                                                                                                                                                                          |
| Visiting-and-Travel-in-the-United-Kingdom | What should I keep in mind when I am traveling to the UK on a student visa from India? Is there any restriction on the medications that I can carry? I will have a prescription along with me to justify my medical conditions and necessary medications. |         1 |       3 | 1/3    | No                   | Followed    | 2018-08-31  | https://www.quora.com/What-should-I-keep-in-mind-when-I-am-traveling-to-the-UK-on-a-student-visa-from-India-Is-there-any-restriction-on-the-medications-that-I-can-carry-I-will-have-a-prescription-along-with-me-to-justify-my-medical |
+-------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------+---------+--------+----------------------+-------------+-------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
```
