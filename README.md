# DHSC-PIM

This repository contains alpha-phase exploration of data and prototypes for the DHSC PIM (Product Information Management) project.

## Prototypes

To get started with the prototypes you will need to have nodejs installed, at the time of writing version 21.5 is required, but check `.tool-versions` to make sure this is up to date.

### Setup steps

To install the baseline prototype, you can follow these steps.

```
cd pard
make -j all
cd ../prototypes/basic
cp .env.sample .env
npm install
```

Next, edit .env using your favourite editor to look like

```
PORT=3000
HOST=0.0.0.0
AUTH_USERNAME=
AUTH_PASSWORD=
DATABASE=../../pard/pard.sqlite
```

You can run the service, with auto-reloading by running the following from the `./prototypes/basic` directory

```
npm run dev
```

You can now view the prototype at [http://127.0.0.1:3000/](http://127.0.0.1:3000/).

Further information on interacting with the basic prototype is available in the [README](prototypes/basic/README.md).
