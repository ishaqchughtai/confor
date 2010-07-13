ALTER TABLE videos
ADD `lang` varchar(5) DEFAULT 'en',
DROP COLUMN `description_fr`,
DROP COLUMN `title_fr`;