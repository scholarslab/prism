
-- Duplicate the word_markings schema.
CREATE TABLE `tmp_word_markings` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `index` int(11) DEFAULT NULL,
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      `user_id` int(11) DEFAULT NULL,
      `facet_id` int(11) DEFAULT NULL,
      `prism_id` varchar(36) DEFAULT NULL,
      PRIMARY KEY (`id`),
      KEY `index_word_markings_on_index` (`index`),
      KEY `index_word_markings_on_prism_id_and_index` (`prism_id`,`index`)
) ENGINE=InnoDB AUTO_INCREMENT=808384 DEFAULT CHARSET=latin1;

-- Crunch down all markings for each user.
INSERT INTO tmp_word_markings
    (`index`, user_id, facet_id, prism_id, created_at, updated_at)
    SELECT `index`, user_id, facet_id, prism_id, MIN(created_at), MAX(updated_at)
    FROM word_markings
    WHERE user_id IS NOT NULL
    GROUP BY `index`, user_id, facet_id, prism_id;

-- Just copy over data from NULL users (legacy data).
INSERT INTO tmp_word_markings
    (`index`, user_id, facet_id, prism_id, created_at, updated_at)
    SELECT `index`, user_id, facet_id, prism_id, created_at, updated_at
    FROM word_markings
    WHERE user_id IS NULL;

-- Swap over the tables.
RENAME TABLE word_markings TO old_word_markings,
             tmp_word_markings TO word_markings;

