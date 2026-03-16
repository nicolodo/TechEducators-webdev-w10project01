-- 1. PROFILES TABLE
CREATE TABLE w10profiles (
    id TEXT PRIMARY KEY, 
    nickname TEXT NOT NULL,
    bio TEXT,
    profile_pic TEXT,
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

-- LIKES TABLE
CREATE TABLE w10Likes (
    user_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    post_id INT REFERENCES w10posts(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, post_id)
)

-- 3. FOLLOWS TABLE
CREATE TABLE w10follows (
    follower_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    following_id TEXT REFERENCES w10profiles(id) ON DELETE CASCADE,
    PRIMARY KEY (follower_id, following_id)
);

-- -- 4. ENABLE ROW LEVEL SECURITY (RLS)
-- ALTER TABLE w10profiles ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE w10posts ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE w10follows ENABLE ROW LEVEL SECURITY;

-- -- 5. CREATE POLICIES
-- -- Profiles: Anyone can view, only the owner can update
-- CREATE POLICY "Public profiles are viewable by everyone" ON w10profiles FOR SELECT USING (true);
-- CREATE POLICY "Users can insert their own profile" ON w10profiles FOR INSERT WITH CHECK (true);
-- CREATE POLICY "Users can update own profile" ON w10profiles FOR UPDATE USING (auth.uid() = id);

-- -- Posts: Anyone can view, only the owner can create/edit/delete
-- CREATE POLICY "Posts are viewable by everyone" ON w10posts FOR SELECT USING (true);
-- CREATE POLICY "Users can insert their own posts" ON w10posts FOR INSERT WITH CHECK (true);
-- CREATE POLICY "Users can update their own posts" ON w10posts FOR UPDATE USING (true);
-- CREATE POLICY "Users can delete their own posts" ON w10posts FOR DELETE USING (true);