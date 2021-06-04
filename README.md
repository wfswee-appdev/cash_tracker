# README

**What is Cash Tracker?**
A simple CRUD app that tracks employee spending across categories, generates automated quarterly reports to facilitate employee reimbursement, and provides basic analytics to employees to assess their spending compared to history and their peers.

**Remaining Development Steps**

1. Ajaxify edit button
2. Implement carrierwave and cloudinary (https://chapters.firstdraft.com/chapters/790)
3. Show error messages for failed ajax form submission
3. Continue working on charts/spendign calculations
4. Write rake task to create automated reports with Heroku task scheduler at the end of each quarter to be delivered by email
5. Secure app

**Remaining Odds and Ends To Do**
1. If no receipt is submitted, show something nice, not a broken image icon
2. Allow transaction details to be viewed in a modal with a larger image of the receipt
3. use datepicker for the date field in the form (https://getdatepicker.com/5-4/Usage/, https://chapters.firstdraft.com/chapters/861#frequently-used-jquery-methods)
4. Implement infinite scrolling instead of pagination 