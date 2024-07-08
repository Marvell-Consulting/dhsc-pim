
# Prototypes

During the Alpha phase, several versions of the prototype were built to iterate for different user research sessions.

The original prototype was implemented in the [basic](./basic) directory, but now simply provides the home page linking to the other versions of the prototype.  The first implementation was moved to [version 1](./v1) and was later followed by [version 2](./v2) and [version 3](./v3).  Each new version was copied from the previous version and then iterated upon.  This means that each version is hosted independently but the build and deployment is the same for each.

The prototypes require NodeJS to be installed. At the time of writing this is 21.5.0, but check [.tool-versions](../.tool-versions) in the root of the repo for exact version to use as it may change over time.

## Local setup

To install a version locally to try it out, the step here will be the same but should be performed in the relevant directory. For instance, if you wish to try out version 2, you should run these steps with your terminal in v2.

### Setup

The dependencies for the prototypes can be installed by running `npm install` in each directory.  This will install the runtime and development dependencies.

### Configuration

To configure the prototype locally, you should copy the `.env.sample` file to a file called `.env` and complete the details.  When you create the .env file, it will be ignored by git to avoid you checking it into the repository.

The .env file will look something like the following and provide the values as environment variables to the prototype:

```
PORT=3000
HOST=127.0.0.1
AUTH_USERNAME=
AUTH_PASSWORD=
DATABASE=../../mhra/mhra.sqlite
```

You can ignore the `PORT` and `HOST` settings unless you need to run the prototype on a different port, or if you need to bind the prototype to a different network interface.

`AUTH_USERNAME` and `AUTH_PASSWORD` are used to implement basic authentication and can be empty so they are ignored when running locally.

`DATABASE` specifies where to find a database for the prototype. You can create the database necessary by visiting the [mhra directory](../mhra/) and running

```
make all
make searchable
```

One the `mhra.sqlite` file has been created, you can set the `DATABASE` value to point directory to the file.


### Build

You can run the prototype, with auto-reloading and auto-compilation by running the following command in the relevant directory.

```
npm run dev
```

You can now view the prototype at http://127.0.0.1:3000/.

## Deploying prototypes

The hosted prototypes are currently deployed on [fly.io](https://fly.io/) with access restricted behind basic authentication.

### Setup

Deployment for the different prototype versions is handled by [github action workflows](../.github/workflows) which will deploy each version when it is merged into main, only if something in that directory has changed.

If you have followed the instructions at https://fly.io/docs/getting-started/ and have a valid fly.io account, you can deploy the apps by running `fly launch` to create the app, and then `fly deploy` to deploy future updates.

To successfully deploy via github actions, you will need to create a fly.io deploy token for each version and store them in 'action secrets' within the github repository settings. See [the workflows](../.github/workflows) to see how they are used.

### Configuration

Configuration for apps deployed to fly.io do not use .env files, instead settings are split across fly.io app settings and the dockerfile for each version.

In fly.io app settings, you should add `AUTH_USERNAME` and `AUTH_PASSWORD` to the secrets section. After another deploy these values will be used as username and password to authenticate users and provide access.

The dockerfile specifies the database location, and this is defaulting to /data/mhra-db.sqlite as the /data directory is a volume provided to each application.  To upload your database there you will likely need to increate the volume size with something like:

```
cd v2
fly volumes extend $(fly volumes list -j | jq -r '.[0].id') -s 2GB
```

Once extended you can upload the database to the /data directory with the following interactive command replacing `PATH_TO_SQLITE` with the actual local path to the mhra.sqlite file:

```
fly sftp shell
>> put PATH_TO_SQLITE /data/mhra-db.sqlite
```
