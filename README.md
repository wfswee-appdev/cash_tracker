# README

**What is Cash Tracker?**
A simple CRUD app that tracks employee spending across categories, generates automated quarterly reports to facilitate employee reimbursement, and provides basic analytics to employees to assess their spending compared to history and their peers.


**Development Steps**

1. Install devise (https://grades.firstdraft.com/resources/4a82935f-5e26-4ba2-af65-6f43cb26e75f)
rails generate devise user username private:boolean transactions_count:integer
2. Define root route
3. Add defaults, indices, and constraints to devise migration
4. Generate transactions scaffold
rails g scaffold transactions amount:decimal vendor receipt owner:references
5. Add defaults, indices, and constraints to transactions migration
6. Migrate DB
7. Install annotate_models
8. Add model validations and belongs_to / has_many
9. Migrate database
10. Build sample data
11. Get simple version working without image upload
12. Implement policies with Pundit
13. Ajaxify
--change category to a list of defined values (meal, travel, misc)--
14. Convert feed and reports to tabs instead of using navbar (check to make sure it looks good on mobile)
15. Implement better bootstrap formatting throughout
16. Add chart to index comparing QTD spending for all quarters so user can see current quarter trend vs their past trends (i.e. are they over or under spending so far this quarter), and also that trend vs trend of average of all users
(https://chartkick.com/, https://github.com/ankane/chartkick)
17. Implement manual approval for new accounts (https://github.com/heartcombo/devise/wiki/How-To%3A-Require-admin-to-activate-account-before-sign_in)
18. Implement carrierwave and cloudinary (https://chapters.firstdraft.com/chapters/790)
19. Create charts/stats for reports page
20. Write rake task to create automated reports with Heroku task scheduler at the end of each quarter to be delivered by email
21. Can I automate periodic downloads of the database as a CSV?

**Odds and Ends ToDo**
1. Change category to an enum with pre-defined fiels. I probably don't want to give users the ability to add a new field, forcing them to categorize transactions in a way that is easier for me in analyzing the budget and spending.

**Database structure**
1. Users
2. Transactions

**UI (2 pages)**
1. Transactions Feed
    (a) Form to enter new transaction (date (auto-disaply today's date), category, amount, receipt upload)
    (b) Show's user's historical activity (last 5 transactions with ability to "load more") including date, store, category, and amount
    (c) Show a summer of user's QTD activity (total amount spent, comparison of current QTD vs prior quarters QTD)
2. Reports
    (a) Show's user's total for the quarter-to-date, simple forecast of full quarer amount, and past 3 completed quarters (preferably in graphical form)
    (b) Show graph of rolling average (past 30 transactions) over the past year

Helper Methods Review
https://grades.firstdraft.com/resources/045c39b0-c507-4d4c-b210-3348a23b8a8b

Scaffold Review
Day 3 recording beginning at 34:00