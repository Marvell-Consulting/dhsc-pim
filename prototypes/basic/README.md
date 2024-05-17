# Basic prototype skeleton

## Requirements

Requires NodeJS to be installed. At the time of writing this is 21.5.0, but check `.tools-versions` in the root of the repo for exact versions.

## Installation

**npm install** - Installs all of the necessary dependencies

## Commands

**npm run dev** - Runs a development server on localhost port 3000, and will reload if any .ts files, or .mustache files are updated

**npm run build** - Compiles to JS and puts the output in the ./dist folder

**npm run start** - Runs a server for the JS files in the ./dist folder

## Structure

### ./templates

[Mustache](https://mustache.github.io/) templates for each page are stored here, with top level layours being stored in the `./templates/layout` folder, and partial templates in `./templates/partial`.

### ./static

This folder contains the stylesheets (in `./static/stylesheets`), the scripts (in `./static/javascripts/`) and assets (in `./static/assets`). This structure is carried across from the govuk design system static download.

A custom css file (`./static/stylesheets/prototype.css`) is available for overriding or extending the govuk stylesheets.

### ./src

The folder contains the source code for the application which uses Typescript.

| File           | Contents                                                                                                                                                              |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| config.ts      | Contains configuration information for the application, primarily loaded from the .env file (which may not exist, but if not can be copied from the .env.sample file) |
| controllers.ts | Contains functions for each endpoint allowing for dynamics actions to happen in response to requests to the bound URL                                                 |
| index.ts       | Performs setup, configuring express, basic auth and routes                                                                                                            |
| models.ts      | Contains exported models for transferring data from the controllers to the templates                                                                                  |
