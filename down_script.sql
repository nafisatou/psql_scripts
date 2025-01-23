#/bin/bash
ALTER TABLE comments
ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);

ALTER TABLE comments
DROP COLUMN comments;

ALTER TABLE comments
DROP CONSTRAINT comments_pkey;
ALTER TABLE likes ADD COLUMN is_liked BOOL;


