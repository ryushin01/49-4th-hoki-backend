-- migrate:up
CREATE TABLE `feed_images` (
  `id` int PRIMARY KEY NOT NULL,
  `url` varchar(512) NOT NULL,
  `text` varchar(500),
  `feed_id` int NOT NULL,
  FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `feed_images`;
