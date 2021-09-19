## Inspiration

Remote work is new to many of us, but we are getting used to it. However, along with its benefits, it comes with many downsides such as little work-life balance, feeling **alone** with no friends to having a quick coffee or water cooler chat.
This lead us to build something to reduce such issues and make **Remote Work** fun!

## What it does

Allow you to register your company on the platform, add employees, add monthly & daily rewards and distribute them in a really fun & engaging way.

Here is brief overview of what it does.

1. Register Company
2. Add Employees (they are invited to platform using email)
3. Add Daily & Monthly Rewards
4. A few random employees are picked by the system very smartly (so the selected user are different on daily basis)
5. A fun company-wide challenge is assigned to the selected employees
6. This the challenge description along with today's participants are posted to a dashboard visible to all employees
7. Selected employees get an email with the challenge page link
8. On visiting the link they are presented with the challenge description and an option to record a 1 min video
9. Submitted videos from every participant is posted to dashboard where all employees can react to the submissions
10. At the end of the day, system automatically generates a poll of today's participants for voting
11. Poll is posted to dashboard where employees can vote for their favourite submission
12. Winner is announced and presented with **Daily Reward** added by the company
13. Cycle repeats the next day
14. At the end of month system automatically pick a random winner smartly (based on multiple factors i.e. reactions and engagement)
15. Winner is presented with **Monthly Reward** added by the company
16. Cycle repeats

### Example Rewards

- Daily: Some bonus, Extra Break Time, etc.
- Monthly: Some bonus, A Day Off, Digital Subscription (Netflix), etc.

## How we built it

The tech-stack we used is at the end of this section, here is how we build the entire thing.

### Selecting the Challenge

A 1 hour meeting was scheduled to discuss all the challenges and decide what to pick. After exploring all the challanges
we liked the idea of contributing to make remote-work fun! hence we picked the RemoteBase challenge.

#### Thought Process

We thought we can reduce loneliness in remote-work if we somehow can engage employees into fun activities. The activities
that are simple enough so everybody can participate along with engaging enough so that everybody can engage, and rewarding 
enough so that there is an Ahaa!!! moment during remote work.

### The Technical Stuff

- Core expertise of our team is **Ruby on Rails**, so this became our framework of choice
- We used **PostgreSQL** as our database of choice because it is relational and go hands in hands with Rails
- In our **database** schema we have the following tables:
  
  - Company
  - Employees
  - Challenges
  - CompanyChallenges (company wide daily challenge)
  - EmployeeChallenges (selected employees for specific day)
  - Submissions
  - Poll (to create submission poll)
  - PollVotes (used to store votes against submissions)
  - Rewards (daily, monthly)
  - Winners

- When a company adds an employee an email invitation is sent to employee with his credentials (which he can update latter)
- Once joined, employee can see a dashboard which shows 

  - Today's Challenge
  - Selected Participants
  - Submissions
  - Voting Poll
  
- All winners are shown in a separate section

#### Challenge Creation & Participants Selection

Challenges are created automatically on daily basis, and here is what's happening behind the scene.

- A cron job starts at 12:30 AM (scheduled with Heroku Scheduler) and assign a random challenge to company
- For each company system smartly pick 4 employees and assign challenges. The system makes sure that employees selected have not completed any challenge in recent days so that every body have a chance for selection
- Why just 4? We think 4 submissions throughout a day won't impact the actual work and casually engage everybody without being to excessive, this way we have a capacity of allowing around **120** different employees to participate

#### Challenge Submission

Upon selection the selected employee get a challenge link via Email, visiting that link leads to a page where employee is presented with:

- Challenge Details
- An option to record (1 min) video of challenge
- On submission the video is uploaded to S3 (AWS cloud storage) and a ThankYou note is presented to employee
- System reflects the submissions in employees **Dashboard** for reactions & views

#### Voting Poll

At the end of day (around 4:30 PM) a **Cron Job** runs and create a poll against today's submisisons for every company

This pole is presented in Employee Dashboard for voting, and employees vote for their favourite submission

#### Winners

Winners are selected by the system (the employee with most votes) and presented in winner section

Monthly Winners are selected from daily winners (randomly). 

#### Rewards

Rewards are added by the company and distributes to the Daily and Monthly Winners.

Rewards examples are given in this [section](#example-rewards)

### Tech Stack

- Ruby on Rails
- PostgreSQL
- HTML, CSS, SCSS, BootStrap
- Ajax, JQuery
- AWS S3 (cloud storage)
- Heroku (for deployment, and scheduling tasks)

### Other Tools

- Figma (for UX & UI design)
- ConceptBoard (for flow design)
- Git (for versioning)
- Meet, Skype, Slack & Whatsapp (for team communication)

