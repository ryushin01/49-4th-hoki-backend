-- migrate:up
CREATE TABLE `user_interests` (
  `id` int PRIMARY KEY NOT NULL,
  `user_id` int NOT NULL,
  `interest_id` int NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `user_interests`;
