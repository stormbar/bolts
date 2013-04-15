Storm Bar Bolts
===============

This repo houses a collection of public Bolts, they are all installable by name.

    bolt install google


Running Locally for Development
-------------------------------

In production Bolts are loaded directly from github but you can run a local server for testing...

    # install libs
    npm install -g grunt-cli
    npm install

    # run the server
    grunt connect

You should use this alongside a local development version of Storm Bar for testing. Once both are running you can install local dev Bolts with...

    bolt install dev/my-bolt-name


Writing A Bolt
---------------

See: http://stormbar.net/bolts.html for documentation in the Bolt API.

Beyond that this repo enforces a few standards to keep things sane. All Bolts...

- are placed in a folder using the bolt name
- are written in CoffeeScript
- are named in lowercase with hyphens e.g. `something-magic`
- have an entry file named `[bolt-name].bolt.coffee`
- have their Homepage set to a `README.md` file in their folder