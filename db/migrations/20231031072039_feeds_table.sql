-- migrate:up
CREATE TABLE `feeds` (
  `id` int PRIMARY KEY NOT NULL,
  `nickname` varchar(10) UNIQUE,
  `text` varchar(500),
  `is_mine` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp,
   FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `feeds`;
