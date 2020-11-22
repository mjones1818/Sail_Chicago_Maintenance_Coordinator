# Description
This website can be used to keep track of all maintenance activity at Sail Chicago. This includes all user activity, parts used and work history

# Install instructions
Download repository. Run the following to install the required dependencies

    bundle install

To seed test data run 

    rake db:seed

In the project directory run 

    shotgun

visit http://localhost:9393/

### license

This application available open source under the terms of the MIT license 
https://opensource.org/licenses/MIT

# Navigation bar
A user can
- go home
- see all users, sailboats, parts and tasks
- logout
Features
- shows name of person in the right corner with a link to their user page
- shows sail chicago logo on the left with a link to the home page

# Landing page
When not logged in:
A user can
- login
- signup

When logged in:
Brief description of what the site is for

Features
- shows name of person logged in

# Signup page
A user can
- click a link to login
- enter a username
- enter an email
- enter a password
Features
- redirected with an error if any field is left blank on submission

# Login page
A user can
- enter a username
- enter a password
Features
- redirected with an error if any field is left blank on submission

# User index #
A user can see
- usernames
- emails
Features
- clicking email starts a new email message
- clicking the username redirects to the user page

#### User show page ####
- username
- email
- tasks completed with dates and links
- tasks to complete with dates and links
- list of boats worked on with links
Features
- Edit and delete only if the user profile is the same as the logged in user

# Sailboats index #
A user can see 
- all sailboats listed by boat type with links
- create a new sailboat

#### Sailboat show page ####
- show all completed and upcoming tasks with dates and links
- create, edit and delete buttons

#### Sailboat new page ####
A user can
- enter a name (required)
- select a boat type radio button (required)
features
- user is redirected back to page if not fully filled out

#### Sailboat edit page ####
A user can
- edit a name (required)
- select a boat type radio button (required)
features
- user is redirected back to page if not fully filled out

# Parts index #
A user can see 
- all parts listed with links
- create a new part

#### Part show page ####
- show name and description
- edit and delete buttons

#### Part new page ####
A user can
- enter a name (required)
- enter a description
features
- user is redirected back to page if not fully filled out

#### Part edit page ####
A user can
- edit a name (required)
- edit a description
features
- user is redirected back to page if name isn't filled out

# Tasks index #
A user can see 
- all Tasks listed with boat type, boat name, task name and date
- create a new task

#### Task show page ####
- show name 
- description
- date completed or due date
- procedure
- all parts used
- who completed the task
- edit and delete buttons

#### Task new page ####
A user can
- enter a name (required)
- enter a description
- enter a procedure
- select a boat from a dropdown seperated by boat type
- select all members involved
- select all parts used
- select either a due or completed date
features
- redirected with an error if any required field is left blank on submission

#### Task edit page ####
A user can
- edit the name (required)
- edit the description
- edit the boat
- edit the members
- edit the date completed or due date
features
- redirected with an error if any required field is left blank on submission
- prefilled with selections