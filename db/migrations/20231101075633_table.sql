-- migrate:up
ALTER TABLE `users` DROP `email`;

-- migrate:down
ALTER TABLE `users` DROP `email`;
