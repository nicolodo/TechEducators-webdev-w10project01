-- 1. PROFILES TABLE
CREATE TABLE w10profiles (
    id TEXT PRIMARY KEY, -- This will store the Clerk userId
    username TEXT NOT NULL,
    bio TEXT,
    profile_image_url TEXT, 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. POSTS TABLE
CREATE TABLE w10posts (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    reply_to INT REFERENCES w10posts(id) ON DELETE SET NULL, 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. LIKES TABLE
CREATE TABLE w10likes (
    user_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    post_id INT REFERENCES w10posts(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, post_id)
);

-- 4. FOLLOWS TABLE
CREATE TABLE w10follows (
    follower_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    following_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    PRIMARY KEY (follower_id, following_id)
);
