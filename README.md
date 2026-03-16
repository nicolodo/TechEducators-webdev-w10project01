
W9 Social Network

I'll have the main page which will
ask you to login if not logged in
The main page will show posts from
all users

The user profile page
/app/user/[id]

/app/user/[id]/settings

Supabase
    
    TABLE user
    id
    bio
    nickname
    profile_pic
    username
    password
    Auth

    <!-- login -> -->

    TABLE LoginInfo : idea scrapped less tables more simple 
    id -> user.id
    username
    password
    Auth

    TABLE post
    id
    sender
    reply_to

File Notes: 
    /utils/db.js : This sets up the db connection such that I don't need to 
    set it up for each page 
