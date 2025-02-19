Book Lending System
A simple Ruby on Rails application for managing a book lending system, allowing users to add books, track borrowings, and manage borrowing history.

📌 Features
📖 Add, edit, and delete books
🔍 View book details, including borrowing history
⏳ Borrow and return books
👤 Track a specific borrower's history
✅ Model validations to ensure data integrity

🛠️ Setup and Installation
1️⃣ Prerequisites
Ensure you have the following installed on your machine:

Ruby (version 3.x recommended) → Download Ruby
Rails (version 8 preferred) → Install with:gem install rails
SQLite3 (if using SQLite) or PostgreSQL (if using PostgreSQL)
2️⃣ Clone the Repository
To get a copy of this project, run:
git clone https://github.com/Celine-grow/Book_Lending_App.git
cd Book_Lending_System
3️⃣ Install Dependencies
Run the following command to install required Ruby gems:bundle install
 Setting Up Environment Variables
Before running the application, you need to set up environment variables for the database connection.
Create a .env file in the project root:touch .env
Add the following variables (replacing with actual credentials):
DATABASE_NAME=Book_Lending_System
DATABASE_USER=your_postgres_username
DATABASE_PASSWORD=your_postgres_password
Load the environment variables by running:source .env
Ensure your config/database.yml uses environment variables:
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: <%= ENV['DATABASE_USER'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
  host: localhost

4️⃣ Set Up the Database
Run these commands to create and migrate the database:
rails db:create
rails db:migrate
rails db:seed   # (Optional: if you have seed data)
5️⃣ Start the Server
Launch the Rails server with:
rails server
Then visit http://localhost:3000 in your browser.

🧪 Running Tests
The application includes basic model and controller tests. Run tests using:
rails test
or
rspec  # If using RSpec
🔧 Troubleshooting
If you encounter missing gems, run:
bundle install
If migrations are missing or outdated, run:
rails db:migrate
If the server fails to start, try:
rails server -b 0.0.0.0
🌟 Future Improvements & Challenges Faced
Due to time constraints, the application currently lacks Bootstrap styling for UI/UX enhancements. However, I am eager to improve it by:

🔹 Implementing Bootstrap for better styling
🔹 Adding authentication for better security
🔹 Enhancing the UI/UX with a cleaner design
This project focuses on functionality first, ensuring the core features work properly before refining the visual aspects.

🤝 Contributing
If you'd like to contribute:

Fork the repository
Create a new branch (git checkout -b feature-branch)
Commit changes (git commit -m "Your message")
Push to GitHub (git push origin feature-branch)
Open a Pull Request
📜 License
This project is open-source and available under the MIT License.

📬 Contact
For any questions, feel free to reach out via:
📧 Email: celineloise4@gmail.com
🔗 GitHub: Celine-grow

