<p align="center">
  <a href="https://www.medusajs.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/59018053/229103275-b5e482bb-4601-46e6-8142-244f531cebdb.svg">
      <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/59018053/229103726-e5b529a3-9b3f-4970-8a1f-c6af37f087bf.svg">
      <img alt="Medusa logo" src="https://user-images.githubusercontent.com/59018053/229103726-e5b529a3-9b3f-4970-8a1f-c6af37f087bf.svg" width=100>
    </picture>
  </a>
  <a href="https://railway.app/template/gkU-27?referralCode=-Yg50p">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://railway.app/brand/logo-light.svg">
      <source media="(prefers-color-scheme: light)" srcset="https://railway.app/brand/logo-dark.svg">
      <img alt="Railway logo" src="https://railway.app/brand/logo-light.svg" width=100>
    </picture>
  </a>
</p>

<h2 align="center">
  Prebaked medusajs 2.0 monorepo
</h2>
<h4 align="center">
  Backend + Storefront + postgres + redis + MinIO + MeiliSearch
</h4>

<h2 align="center">
  <a href="https://railway.app/template/gkU-27?referralCode=-Yg50p">one-click deploy on railway!</a>
</h2>

<h1 align="center">
  Need help?<br>
  <a href="https://funkyton.com/medusajs-2-0-is-finally-here/">Step by step deploy guide, and video instructions</a>
</h1>

<p align="center">
Combine Medusa's modules for your commerce backend with the newest Next.js 14 features for a performant storefront.</p>

## About this boilerplate
This boilerplate is a monorepo consisting of the officially released MedusaJS 2.0 backend and storefront application. It is a pre-configured, ready-to-deploy solution, modified for seamless deployment on [railway.app](https://railway.app?referralCode=-Yg50p).

Updated: to `version 2.6.1` 🥳

## Preconfigured 3rd party integrations

- MinIO file storage: Replaces local file storage with MinIO cloud storage, automatically creating a 'medusa-media' bucket for your media files. [README](backend/src/modules/minio-file/README.md)
- Resend email integration [Watch setup video](https://youtu.be/pbdZm26YDpE?si=LQTHWeZMLD4w3Ahw) - special thanks to [aleciavogel](https://github.com/aleciavogel) for Resend notification service, and react-email implementation! [README](backend/src/modules/email-notifications/README.md)
- Stripe payment service: [Watch setup video](https://youtu.be/dcSOpIzc1Og)
- Meilisearch integration by [Rokmohar](https://github.com/rokmohar/medusa-plugin-meilisearch): Adds powerful product search capabilities to your store. When deployed on Railway using the template, MeiliSearch is automatically configured. (For non-railway'ers: [Watch setup video](https://youtu.be/hrXcc5MjApI))

# /backend

### local setup
Video instructions: https://youtu.be/PPxenu7IjGM

- `cd /backend`
- `pnpm install` or `npm i`
- Rename `.env.template` ->  `.env`
- To connect to your online database from your local machine, copy the `DATABASE_URL` value auto-generated on Railway and add it to your `.env` file.
  - If connecting to a new database, for example a local one, run `pnpm ib` or `npm run ib` to seed the database.
- `pnpm dev` or `npm run dev`

### requirements
- **postgres database** (Automatic setup when using the Railway template)
- **redis** (Automatic setup when using the Railway template) - fallback to simulated redis.
- **MinIO storage** (Automatic setup when using the Railway template) - fallback to local storage.
- **Meilisearch** (Automatic setup when using the Railway template)

### commands

`cd backend/`
`npm run ib` or `pnpm ib` will initialize the backend by running migrations and seed the database with required system data.
`npm run dev` or `pnpm dev` will start the backend (and admin dashboard frontend on `localhost:9000/app`) in development mode.
`pnpm build && pnpm start` will compile the project and run from compiled source. This can be useful for reproducing issues on your cloud instance.

# /storefront

### local setup
Video instructions: https://youtu.be/PPxenu7IjGM

Install dependencies `npm i` of `pnpm i`
Rename `.env.local.template` ->  `.env.local`

### requirements
- A running backend on port 9000 is required to fetch product data and other information needed to build Next.js pages.

### commands
`cd storefront/`
`npm run dev` or `pnpm dev` will run the storefront on uncompiled code, with hot-reloading as files are saved with changes.

## Useful resources
- How to setup credit card payment with Stripe payment module: https://youtu.be/dcSOpIzc1Og
- https://funkyton.com/medusajs-2-0-is-finally-here/#succuessfully-deployed-whats-next
  
<p align="center">
  <a href="https://funkyton.com/">
    <div style="text-align: center;">
      A template by,
      <br>
      <picture>
        <img alt="FUNKYTON logo" src="https://res-5.cloudinary.com/hczpmiapo/image/upload/q_auto/v1/ghost-blog-images/funkyton-logo.png" width=200>
      </picture>
    </div>
  </a>
</p>

## Railway Deployment

This is a monorepo project with both backend and storefront configured for Railway deployment.

### Commit Changes

When committing changes to trigger Railway builds:

1. **For backend changes only**:
   ```
   git add backend/
   git commit -m "backend: your commit message"
   git push
   ```

2. **For storefront changes only**:
   ```
   git add storefront/
   git commit -m "storefront: your commit message"
   git push
   ```

3. **For changes to both**:
   ```
   git add .
   git commit -m "all: your commit message"
   git push
   ```

Railway is configured to detect which service to build based on the changes in each commit.

# Flowdose Ecosystem

## Infrastructure and Deployment

### Terraform Infrastructure

This project uses Terraform to manage infrastructure on DigitalOcean. All infrastructure configuration is in the `/terraform` directory.

#### Setting up for Deployment

1. **Bootstrap** (one-time setup):
   - Run the GitHub Actions workflow `terraform-bootstrap.yml` to create the state storage bucket
   - Create access keys for the Spaces bucket in DigitalOcean console

2. **Required Secrets**
   Add these secrets to your GitHub repository:
   - `DO_API_TOKEN`: DigitalOcean API token
   - `DO_SPACES_ACCESS_KEY`: Spaces access key for state storage
   - `DO_SPACES_SECRET_KEY`: Spaces secret key for state storage
   - `DO_SSH_PUBLIC_KEY`: SSH public key for droplet provisioning
   - `DO_SSH_PRIVATE_KEY`: SSH private key for deployment
   - `DATABASE_URL`: PostgreSQL connection URL
   - `REDIS_URL`: Redis connection URL
   - `POSTGRES_HOST`: PostgreSQL host
   - `REDIS_HOST`: Redis host
   - `JWT_SECRET`: Secret for JWT tokens
   - `COOKIE_SECRET`: Secret for cookies
   - `ADMIN_PASSWORD`: Password for Medusa admin
   - `PUBLISHABLE_KEY`: Medusa publishable key
   - `DOMAIN_NAME`: Domain name (optional)
   - `ADMIN_EMAIL`: Email for Let's Encrypt certificates (optional)

### Deployment Architecture

The deployment is split into two main components:

1. **Infrastructure (Terraform)**
   - Manages DigitalOcean resources (droplets, volumes, domains)
   - Sets up basic server environment (Docker, directories, network)
   - Changes to files in `/terraform` directory trigger infrastructure updates

2. **Application Deployment (GitHub Actions)**
   - Manages deployment of backend and storefront applications
   - Uses Docker Compose configurations in `/deploy` directory
   - Changes to files in `/backend` or `/storefront` directories trigger application updates

This separation ensures that infrastructure and application deployments don't conflict with each other.
