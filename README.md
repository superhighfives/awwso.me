# Awwsome

A URL shortener I built in Rails over the last few days of 2010. You paste in a long URL, it gives you a short one on awwso.me.

Status: archived. Made in 2010, not maintained. The awwso.me domain no longer serves it.

## Running it

This is Rails 3.0.3 with the `sqlite3-ruby` gem, so it won't install on a modern Ruby without a fair amount of work. On a Ruby 1.8.7 or 1.9.2 setup of the era it was:

```
bundle install
rake db:schema:load
rails server
```

## How it works

- Each link is an `Item` row in SQLite with a `location` column, validated as an `http` or `https` URL.
- `lib/base58.rb` encodes the row ID in base 58 (no `0`, `O`, `I` or `l`) to make the short code.
- `/u/:id` decodes the code and redirects to the stored URL. `/new/:id` shows the short link after you create one.
- The home page is the new-link form. The `index` action is commented out, so there's no list of links.
