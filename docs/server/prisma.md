## Prisma Commands
### Initialize Prisma
`npx prisma init`: Initializes Prisma in the current project.
* Creates the Prisma schema and Prisma configuration files.

### Generate Prisma Client
`npx prisma generate`: Generates the Prisma Client based on the Prisma schema.
* Run this after making changes to the Prisma schema.

### Format Prisma Schema
`npx prisma format`: Formats the `schema.prisma` file.
* Automatically formats the Prisma schema.

### Validate Prisma Schema
`npx prisma validate`: Validates the Prisma schema for errors.
* Checks whether the Prisma schema is valid.

### Pull Database Schema
`npx prisma db pull`: Reads the existing database structure and updates the Prisma schema.
* Useful when the database already exists.

### Push Schema to Database
`npx prisma db push`: Pushes the Prisma schema directly to the database.
* Does not create migration files.
* Useful for quick development or prototyping.

### Create and Apply Migration
`npx prisma migrate dev`: Creates and applies a migration for development.
* Updates the database based on changes in the Prisma schema.

### Create Named Migration
`npx prisma migrate dev --name <migration-name>`: Creates and applies a migration with a specific name.
Example:
`npx prisma migrate dev --name add_equipment`

### Deploy Migrations
`npx prisma migrate deploy`: Applies pending migrations to the database.
* Mainly used for staging and production environments.

### Check Migration Status
`npx prisma migrate status`: Shows the current migration status.
* Helps identify pending or failed migrations.

### Reset Database
`npx prisma migrate reset`: Resets the database and reapplies all migrations.
* Deletes existing development data.
* Useful when rebuilding a development database.

### Seed Database
`npx prisma db seed`: Runs the database seed script configured in Prisma.
* Used to insert initial or test data.

### Open Prisma Studio
`npx prisma studio`: Opens Prisma Studio.
* Provides a GUI for viewing and editing database records.

### Execute SQL
`npx prisma db execute --file <file.sql>`: Executes SQL from a file against the configured database.

### Check Prisma Version
`npx prisma version`: Displays the installed Prisma CLI and Client versions.

### Prisma Help
`npx prisma --help`: Displays all available Prisma CLI commands.

### Command-Specific Help
`npx prisma <command> --help`: Displays available options for a specific Prisma command.
Example:
`npx prisma migrate --help`
