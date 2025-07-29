# Next.js Exam

Objective:

Build a small blog application with an admin dashboard. The app should display blog posts publicly and allow admin users to create, edit, and delete posts.

## Setup
- Initialize a Next.js project using create-next-app with TypeScript.
- Set up Tailwind CSS or any styling solution of your choice.

## Database
- Define a SQLite or PostgreSQL database with the following models:

```
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  role      String   @default("user") // "user" or "admin"
  posts     Post[]
}

model Post {
  id        String   @id @default(cuid())
  title     String
  content   String
  published Boolean  @default(false)
  created_at DateTime @default(now())
  authorId  String
  author    User     @relation(fields: [authorId], references: [id])
}
```


## Auth
- Use next-auth with GitHub or email/password providers.
- Add a login page with a sign-in button.
- Protect the dashboard route so only authenticated users with role admin can access it.
- Create a dashboard under /admin route.

## Admin
Allow an admin to:
- View all posts (regardless of published status).
- Create a new post (form with title, content, publish toggle).
- Edit existing posts.
- Delete posts.
- Use react-hook-form or formik for form handling.
- Use API routes under /pages/api/posts for CRUD operations.
  
## Public
- Public route / should show a list of published blog posts.
- Each post links to a dynamic page /posts/[id] with full content.
- Use getStaticProps and getStaticPaths or getServerSideProps for fetching data.