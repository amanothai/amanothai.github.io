# Amano Challenge - Next Note CRUD
Time: 45 minutes recommended.

Evaluate deeper React/Next.js knowledge, API interaction, form handling, and modular code design.

Build a Note Manager that allows users to:
- View all notes.
- Add a new note.
- Delete an existing note.

Use mocked API routes via Next.js API (you don’t need a database, just keep notes in memory).

## Requirements:
#### 1.	GET /api/notes
- Returns all notes.
#### 2.	POST /api/notes
- Accepts a title and description to create a new note.
#### 3.	DELETE /api/notes/:id
- Deletes a note by ID.
#### 4.	Frontend:
- Display the list of notes.
- Create note form with validation (title required, min 3 characters).
- Delete button for each note.
#### 5.	Optional (Bonus):
- Use react-hook-form for form management.
- Add optimistic UI (remove the note from the UI before waiting for the server response).

Feel free to use the internet to look up any coding references, but please do not use AI or ask anyone else for help. We want to see how you code.