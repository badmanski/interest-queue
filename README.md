# interest-queue

Service that calculates interest based on incoming amount and duration

## Installation

Execute in your shell:

    $ npm install

## Usage

### Set up secrets.yml

Being in project's root directory create a copy of `example.secrets.yml`:

    $ cp example.secrets.yml secrets.yml

Replace example values with actual secrets

### As is

Execute in your shell:

    $ coffee index.coffee

### Compiled to javascript

Compile the source code:

    $ coffee -c *.coffee

Execute in your shell:

    $ node index.js
