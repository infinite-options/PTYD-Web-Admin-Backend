# Prep-To-Your-Door

This repository contains the entire codebase for the revamped Prep To Your Door, a vegan meal ordering app. You can access the live website [here.](https://preptoyourdoor.netlify.app)

### `client/`
This is where the frontend lies. It is done in React, and can be run within the directory with the command `npm run`. Be sure to `npm install` all Node dependencies.

Once Node is running the app, you can access it on your browser at `localhost:3000`.

### `admin/`
Similar to `client/`, but for the admin-facing web user interface.

### `api/`
This directory contains code for middleware / backend stuff. The APIs allow the web user interface to talk to the database.

### `snapshots/`
This directory contains an automated script that checks for subscription renewals and other related data.
