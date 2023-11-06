-- migrate:up
CREATE TABLE `feed_images` (
  `id` int PRIMARY KEY NOT NULL,
  `url1` varchar(512) NULL,
  `text1` varchar(500),
  `url2` varchar(512) NULL,
  `text2` varchar(500),
  `url3` varchar(512) NULL,
  `text3` varchar(500),
  `url4` varchar(512) NULL,
  `text4` varchar(500),
  `url5` varchar(512) NULL,
  `text5` varchar(500),
  `feed_id` int NOT NULL,
  FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `feed_images`;
