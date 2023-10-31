-- migrate:up
CREATE TABLE `comments` (
  `id` int PRIMARY KEY NOT NULL,
  `content` varchar(30) NOT NULL,
  `user_id` int NOT NULL,
  `feed_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `comments`;
