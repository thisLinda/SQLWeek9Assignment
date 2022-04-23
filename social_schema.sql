DROP TABLE if exists comments;
DROP TABLE if exists posts;
DROP TABLE if exists social;

CREATE TABLE users (
  user_id int NOT NULL auto_increment,
  first_name varchar(40) NOT NULL,
  last_name varchar(40) NOT NULL,
  user_name varchar(40) NOT NULL,
  email varchar(64) NOT NULL,
  password varchar(40) NOT NULL,
  phone_number varchar(20),
  PRIMARY KEY (user_id)
);

CREATE TABLE posts (
  post_id int NOT NULL auto_increment,
  user_id int NOT NULL,
  post_content text NOT NULL,
  publish_timestamp timestamp NOT NULL default current_timestamp,
  PRIMARY KEY (post_id),
  FOREIGN KEY (user_id) references users (user_id)
);

CREATE TABLE comments (
  comment_id int NOT NULL auto_increment,
  post_id int NOT NULL,
  user_id int NOT NULL,
  comment text NOT NULL,
  publish_timestamp timestamp NOT NULL default current_timestamp,
  PRIMARY KEY (comment_id),
  FOREIGN KEY (post_id) references posts (post_id) on delete cascade,
  FOREIGN KEY (user_id) references users (user_id)
);