-- migrate:up
CREATE TABLE `interests` (
  `id` int PRIMARY KEY NOT NULL,
  `interests1` varchar(20),
  `interests2` varchar(20),
  `interests3` varchar(20),
  `user_id` int NOT NULL,
  `feed_id` int NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `interests`;
