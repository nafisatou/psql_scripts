
 CREATE DATABASE social_mediadb;

\c social_mediadb;
create type reactions_enum AS ENUM('sad','happy','angry');

create table users(id SERIAL PRIMARY KEY NOT NULL,name VARCHAR(199) NOT NULL, email VARCHAR(199) NOT NULL,password VARCHAR(10) NOT NULL, profile_picture BYTEA, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP);  

CREATE TABLE interests (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(199) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);
create table posts(id SERIAL PRIMARY KEY NOT NULL, content TEXT, image_url TEXT, video_url TEXT,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,user_id INT NOT NULL,FOREIGN KEY(user_id) REFERENCES users(id), interest_id INT NOT NULL,FOREIGN KEY(interest_id) REFERENCES interests(id));

create table followers(id SERIAL PRIMARY KEY NOT NULL,user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES users(id),follower_id INT NOT NULL, FOREIGN KEY (follower_id) REFERENCES users(id),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

create table comments(id SERIAL PRIMARY KEY NOT NULL, post_id INT NOT NULL, FOREIGN KEY (post_id) REFERENCES posts(id),user_id INT NOT NULL,FOREIGN KEY (user_id) REFERENCES users(id),comments TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

 CREATE TABLE reactions (
    id SERIAL PRIMARY KEY NOT NULL,                                                    
    reaction reactions_enum NOT NULL,                                                                  
    post_id INT NOT NULL,FOREIGN KEY (post_id) REFERENCES posts(id),                                                                                                                              
    comment_id INT,FOREIGN KEY (comment_id) REFERENCES comments(id),
    user_id INT NOT NULL,FOREIGN KEY (user_id) REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP                                       
);
CREATE TABLE categories (
    id SERIAL PRIMARY KEY NOT NULL, 
    interest_id INT NOT NULL,FOREIGN KEY(interest_id) REFERENCES interests(id), 
    user_id INT NOT NULL,FOREIGN KEY (user_id) REFERENCES users(id),                             
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
                                         
\c social_mediadb;

INSERT INTO interests (name) 
VALUES 
('Sports'), 
('Music'),  
('Technology'), 
('Travel');

INSERT INTO users (name, email, password, profile_picture) VALUES ('Joy', 'joy@gmail.com', 'passwd123', NULL),
('frank', 'frank@gmail.com', 'frank789', NULL),('favy','favy@gmail.com','favypass',NUll);
 
INSERT INTO posts (content,interest_id,user_id) VALUES ('This is my first post!','1','1'),('having fun at the party!','2','1'),('the outing was perfect','2','1');

INSERT INTO comments (post_id, user_id,comments)
VALUES
(2, 1, 'Great post! I love the content.'),
(2, 1, 'This video is amazing, keep it up!'),
(2, 2, 'Nice picture, really captured the moment.'),
(3, 2, 'I agree, very interesting post!'),
(3, 3, 'this is wonderful! Keep posting!');

INSERT INTO reactions (reaction, post_id, comment_id, user_id)
VALUES                    
  ('sad', 3, 3, 1), 
  ('angry', 2, 1, 2), 
  ('sad', 3, 2, 3), 
  ('happy', 3, 3, 3);
 
INSERT INTO categories (interest_id, user_id)
VALUES 
  ('1', 1),                                                                     
  ('2', 2),                                                                     
  ('3', 3);                  

create table notifications(id SERIAL PRIMARY KEY NOT NULL, email  VARCHAR(199) NOT NULL,user_id INT NOT NULL,FOREIGN KEY (user_id) REFERENCES users(id),notifications TEXT,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO followers (user_id, follower_id)
VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(2, 3);

