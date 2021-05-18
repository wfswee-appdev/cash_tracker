# README

1. Install devise (https://grades.firstdraft.com/resources/4a82935f-5e26-4ba2-af65-6f43cb26e75f)
rails generate devise user username private:boolean transactions_count:integer
2. Define root route
3. Add defaults, indices, and constraints to devise migration
2. Generate transactions scaffold
rails g scaffold transactions amount:decimal vendor receipt owner:references
3. Add defaults, indices, and constraints to transactions migration
3. Migrate DB
3. Install annotate_models
4. Add model validations and belongs_to / has_many
5. Migrate database
6. Get simple version working without image upload
7. Implement carrierwave and cloudinary (https://chapters.firstdraft.com/chapters/790)
8. Implement policies with Pundit
9. Implement manual approval for new accounts (https://github.com/heartcombo/devise/wiki/How-To%3A-Require-admin-to-activate-account-before-sign_in)
10. Build sample data
11. Add bootstrap
12. Ajaxify
13. Can I automate periodic downloads of the database as a CSV?

Database structure
1. Users (first name, last name, email, password)
2. Transactions (date (not date created), amount, store, link to image of receipt)

UI (2 pages)
1. Feed
    (a) Form to enter new transaction (date (auto-disaply today's date), store, amount, receipt upload)
    (b) Show's user's historical activity (last 5 transactions with ability to "load more") including date, store, category, and amount
2. Reports
    (a) Show's user's total for the quarter-to-date, simple forecast of full quarer amount, and past 3 completed quarters (preferably in graphical form)
    (b) Show graph of rolling average (past 30 transactions) from inception

Helper Methods Review
https://grades.firstdraft.com/resources/045c39b0-c507-4d4c-b210-3348a23b8a8b

Scaffold Review
Day 3 recording beginning at 34:00