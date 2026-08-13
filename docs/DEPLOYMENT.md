# Golden Pot Shop V2 deployment

## What this deployment supports

- Rails application running in Docker on Render.
- SQLite data persisted on a Render disk mounted at `/rails/storage`.
- Basic authentication for `/admin/*` using `ADMIN_USERNAME` and `ADMIN_PASSWORD`.
- A checkout **demonstration only**. No payment gateway is configured, no purchase is created, and payment data is not stored.

## Before pushing

1. Run `bin/rails test` and `RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 bin/rails assets:precompile`.
2. Commit the Version 2 branch and push it to GitHub.
3. Keep `config/master.key` private. Never commit it.

## Create the Render service

1. In Render, choose **New → Blueprint** and select the GitHub repository.
2. Render reads `render.yaml` from the repository root.
3. Provide values for these secret environment variables in Render:
   - `RAILS_MASTER_KEY` — the contents of local `config/master.key`.
   - `ADMIN_USERNAME` — a unique production administrator name.
   - `ADMIN_PASSWORD` — a long, unique production administrator password.
4. Approve the Blueprint and wait for the health check at `/up` to pass.
5. The service prepares the database and seeds the initial catalogue automatically only when the persistent database is empty. To deliberately reset the catalogue later, run `bin/rails db:seed:replant` from the Render Shell; it replaces all products.

## After deployment

- Check the public storefront and `/admin/dashboard`.
- Confirm that the checkout page states that no purchase occurs and accepts only `4242 4242 4242 4242`.
- Keep the disk-backed service at one instance: SQLite on a single persistent disk is not for horizontal scaling.
