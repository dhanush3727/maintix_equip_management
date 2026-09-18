# CI (Continuous Integration)
## Definition:
CI is the process of automatically checking your code whenever you push changes to the repository, so you can know whether the new code is working correctly before it gets merged or deployed.

## Explaination:
```yml
name: Maintix CI

on:
  push:
    branches:
      - main

  pull_request:
    branches:
      - main

jobs:
  client:
    name: Client CI
    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: client

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 24
          cache: npm
          cache-dependency-path: client/package-lock.json

      - name: Install dependencies
        run: npm ci

      - name: Lint Client
        run: npm run lint

      - name: Build client
        run: npm run build

  server:
    name: Server CI
    runs-on: ubuntu-latest

    env:
      DATABASE_URL: ${{secrets.DATABASE_URL}}
      PORT: ${{secrets.PORT}}
      JWT_ACCESS_SECRET: ${{secrets.CI_JWT_ACCESS_SECRET}}
      JWT_REFRESH_SECRET: ${{secrets.CI_JWT_REFRESH_SECRET}}
      EMAIL_ID: ${{secrets.EMAIL_ID}}
      EMAIL_PASSWORD: ${{secrets.EMAIL_PASSWORD}}
      EMAIL_HOST: ${{secrets.EMAIL_HOST}}
      EMAIL_PORT: ${{secrets.EMAIL_PORT}}
      CLOUDINARY_API_KEY: ${{secrets.CLOUDINARY_API_KEY}}
      CLOUDINARY_API_SECRET: ${{secrets.CLOUDINARY_API_SECRET}}
      CLOUDINARY_NAME: ${{secrets.CLOUDINARY_NAME}}
      CLIENT_URL: ${{secrets.CLIENT_URL}}

    services:
      postgres:
        image: postgres:17
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: maintix_test
        ports:
          - 5432:5432
        options: >-
          --health-cmd="pg_isready -U postgres -d maintix_test"
          --health-interval=10s
          --health-timeout=5s
          --health-retries=5

    defaults:
      run:
        working-directory: server

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 24
          cache: npm
          cache-dependency-path: server/package-lock.json

      - name: Install dependencies
        run: npm ci

      - name: Generate Prisma client
        run: npx prisma generate

      - name: Run Prisma migrations
        run: npx prisma migrate deploy

      - name: Build server
        run: npm run build

  e2e:
    name: E2E Tests
    runs-on: ubuntu-latest

    env:
      NEXT_PUBLIC_API_URL: ${{secrets.NEXT_PUBLIC_API_URL}}
      PLAYWRIGHT_TEST_EMAIL: ${{secrets.PLAYWRIGHT_TEST_EMAIL}}
      PLAYWRIGHT_TEST_PASSWORD: ${{secrets.PLAYWRIGHT_TEST_PASSWORD}}
      DATABASE_URL: ${{secrets.DATABASE_URL}}
      JWT_ACCESS_SECRET: ${{secrets.CI_JWT_ACCESS_SECRET}}
      JWT_REFRESH_SECRET: ${{secrets.CI_JWT_REFRESH_SECRET}}
      EMAIL_ID: ${{secrets.EMAIL_ID}}
      EMAIL_PASSWORD: ${{secrets.EMAIL_PASSWORD}}
      EMAIL_HOST: ${{secrets.EMAIL_HOST}}
      EMAIL_PORT: ${{secrets.EMAIL_PORT}}
      CLOUDINARY_API_KEY: ${{secrets.CLOUDINARY_API_KEY}}
      CLOUDINARY_API_SECRET: ${{secrets.CLOUDINARY_API_SECRET}}
      CLOUDINARY_NAME: ${{secrets.CLOUDINARY_NAME}}
      CLIENT_URL: ${{secrets.CLIENT_URL}}

    services:
      postgres:
        image: postgres:17

        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: maintix_test

        ports:
          - 5432:5432

        options: >-
          --health-cmd="pg_isready -U postgres -d maintix_test"
          --health-interval=10s
          --health-timeout=5s
          --health-retries=5

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 24
          cache: npm
          cache-dependency-path: |
            client/package-lock.json
            server/package-lock.json

      - name: Install client dependencies
        working-directory: client
        run: npm ci

      - name: Install server dependencies
        working-directory: server
        run: npm ci

      - name: Generate Prisma client
        working-directory: server
        run: npx prisma generate

      - name: Run Prisma migrations
        working-directory: server
        run: npx prisma migrate deploy

      - name: Seed test database
        working-directory: server
        run: npx prisma db seed

      - name: Install Playwright browsers
        working-directory: client
        run: npx playwright install --with-deps chromium

      - name: Run Playwright test
        working-directory: client
        run: npx playwright test
```
In this CI,
### `name: Maintix CI`:
- The workflow starts with `name`, this gives your `GitHub Actions` workflow a name.
- We will see `Maintix CI` in the repository actions page.

### `on`:
- The `on` defines the events that trigger your workflow. In simple, when should github actions start this workflow.
- This workflow has two triggers that is `push` and `pull_request`.
- `push`: Run the `Maintix CI` workflow when code is pushed to the `main` branch.
- `pull_request`: Run the workflow when a Pull Request targets the `main` branch.

### `jobs`:
- The `jobs` section defines the different jobs that GitHub actions needs to execute as part of the workflow.
- Each job is an independent group of steps that runs on a runner.
- In this CI, we have three jobs,
- `client`: handles client-side checks and build.
- `server`: handles server-side checks, database setup, and build.
- `e2e`: runs end-to-end tests using the client, server, database, and playwright.

### Client Job:
- The `client` job is responsible for checking and building the Maintix Next.js client application.

1. `name: Client CI`: 
- Gives the client job a display name. 
- This is the name shown for the job in the GitHub Actions interface. 
- The job ID is `client`, while the display name is `Client CI`.

2. `runs-on: ubuntu-latest`:
- Specifies the runner environment where this job will execute.
- `ubuntu-latest` tells GitHub actions to provide a GitHub-hosted Ubuntu runner.
- All the steps inside the `client` job executes on this runner.

3. `defaults`:
- Sets the defaults working directory for `run` steps in this job.
- Therefore, commands such as `run: npm ci` are executed inside `client/`, not to `uses:` actions

4. `steps`:
- Defines the individual operations that the `client` job performs.
- The `Client CI` has five steps.

5. `Checkout repository`:
- This is the first step in the `Client CI` job.
- `name: checkout repository`: 
    - Gives the step a descriptive name.
    - GitHub Actions displays this name in the workflow logs.
- `uses: actions/checkout@v4`:
    - Tells Github Action to use the `checkout` action.
    - `actions/checkout` is a reusable action provided by GitHub.
    - Its purpose is to *checkout the repository code onto the runner*.
- In simple `actions/checkout@v4` gets the project repository code onto the runner so the reamining CI steps can work with it.

6. `Setup Node.js`:
- `name: Setup Node.js`:
    - Gives a name to this step.
    - This name is shown in the GitHub Action logs.
- `uses: actions/setup-node@v4`:
    - Uses the official GitHub Action for setting up `Node.js`
    - It installs/configures the required Node.js version on the GitHub runner.
- `with`: Tells GitHub Actions to use Node.js version `24`.
- `node-version: 24`: 
    - Tells GitHub Actions to use Node.js version `24`.
    - This matches the Node.js version used by the project.
- `cache: npm`:
    - Enables npm dependency caching.
    - GitHub Actions can reuse previously downloaded npm packages in later workflow runs.
    - This can make dependency installation faster.
    - It does not install the project's dependencies and it does not cache `node_modules`.
- `cache-dependency-path: client/package-lock.json`:
    - Tells `setup-node` where the client's npm lockfile is located.
    - GitHub Actions uses this lockfile when creating the npm cache key.
    - This is important because the `package-lock.json` is inside the `client` directory, not the repository root.
**Note: GitHub Actions has reusable actions created by GitHub and the community. So we use that**

7. `Install Dependencies`:
- `name: Install dependencies`:
    - Gives a *name* to this step.
    - This name is shown in the GitHub Actions logs.
- `run: npm ci`:
    - Executes the `npm ci` command on the GitHub runner.
    - It installs the dependencies required by the project.
    - It follows the lockfile exactly.

8. `Lint Clien`:
- `name: Lint Client`:
    - Gives a *name* to this step.
    - This name is shown in the GitHub Actions logs.
- `run: npm run lint`:
    - Executes the `lint` script from the client's `package.json`.

9. `Build Client`:
- `name: Build client`:
    - Gives a *name* to this step.
    - This name is shown in the GitHub Actions logs.
- `run: npm run build`:
    - Executes the `build` script from `client/package.json`.

### Server Job:
1. `server`:
- This is the job ID.
- GitHub Actions identifies this job using `server`.

2. `name: Server CI`:
- This is the display name of the job.
- GitHub shows *Server CI* in the Actions interface.

3. `runs-on: ubuntu-latest`:
- This job also runs on a GitHub-hosted Ubuntu runner.
- So GitHub creates a separate runner for this job.

4. `env`:
- Defines environment variables that are available to the commands running in this job.
- `${{secrets.NAME}}`: Reads a value from GitHub Actions Secrets. The actual value is stored in GitHub, not directly inside the workflow file.

5. `PostgreSQL Service`:
- `services`:
    - Defines additional service containers that are required by the job.
    - GitHub Actions starts these containers alongside the job's runner.
- `postgres`:
    - This is the name of the service.
    - We are creating a PostgreSQL service for the server CI job.
- `image: postgres:17`:
    - Tells GitHub Actions to create the service using the `postgres:17` Docker image.
    - This gives the CI job a PostgreSQL 17 database.
- `env`:
    - These are environment variables given to the PostgreSQL container.
    - They configure the PostgreSQL database when the container starts.
    - These values are not fixed defaults that you must use.
- `POSTGRES_USER: postgres`: Creates/uses `postgres` as the PostgreSQL username.
- `POSTGRES_PASSWORD: postgres`: Sets the PostgreSQL password to `postgres`.
- `POSTGRES_DB: maintix_test`: Creates a database named `maintix_test`.
- `ports: 5432:5432`: Maps a port from the GitHub Actions runner to PostgreSQL service container. The format is `HOST_PORT:CONTAINER_PORT`.
- `options`: This field allows us to pass Docker container options when GitHub starts the PostgreSQL service.
- `--health-cmd="pg_isready -U postgres -d maintix_test"`:
    - Specifies the command Docker should use to check whether PostgreSQL is ready.
    - `pg_isready` is a PostgreSQL utility that checks whether the PostgreSQL server is accepting connections.
    - `-U postgres` checks using the `postgres` user.
    - `-d maintix_test` checks the `maintix_test` database.
- `--health-interval=10s`: Runs the health check every 10 seconds.
- `--health-timeout=5s`: Gives each health check up to 5 seconds to respond.
- `--health-retries=5`: If the health check fails, Docker retries it up to 5 times before considering the service unhealthy.

6. `Generate Prisma Client`:
- `name: Generate Prisma client`:
    - Gives a name to this step.
    - This name is shown in the GitHub Actions logs.
- `run: npx prisma generate`:
    - Runs the Prisma CLI command that generates the Prisma Client.
    - npx allows us to execute the Prisma CLI installed in the project's dependencies.
- `prisma generate`: 
    - Reads your Prisma schema: `server/prisma/schema.prisma`
    - Based on that schema, Prisma generates the Prisma Client that your NestJS application uses.

7. `Run Prisma Migrations`:
- `name: Run Prisma migrations`:
    - Gives a name to this step.
    - This name is shown in the GitHub Actions logs.
- `run: npx prisma migrate deploy`:
    - Runs Prisma's migration deployment command.
    - It applies the existing Prisma migrations to the PostgreSQL database.
- `prisma migrate deploy`: 
    - Looks at the migrations inside: `server/prisma/migrations/`.
    - Then applies any migrations that have not yet been applied to the database.

### E2E Job:
- In this just only covered what we haven't covered in the previous jobs

1. `Install client dependencies`:
    - This step is run only the `client` directory.
    - Insall the dependencies for `client`.

2. `Install the server dependencies`:
    - This step is run only the `server` directory.
    - Install the dependencies for `server`.

3. `Seed test database`:
    - Seed the data to database.

4. `Install Playwright browsers`:
    - Install the playwright browser with os level dependencies.

5. `Run playwright test`:
    - Run the playwright test in the `client` directory