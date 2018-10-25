CockroachDB init container
==========================

Initialize CockroachDB with database and user with ALL grants on it

Environment:

  - COCKROACH_HOST: <cockroachdb-hostname>
  - DB_NAME: <database-name>
  - DB_USER: <username>
