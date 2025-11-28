# Amano Challenge - JWT + CRUD
Time: 60 minutes recommended.

#### Build a small ASP.NET Core Web API with:
1. JWT Authentication (/auth/login)
2. CRUD for Tasks (/api/tasks)
3. Role-based permission: only Admin may DELETE
4. (Optional if time) small add-ons (caching / background job / aggregation / file upload)

#### Evaluation Focus
- Clean API design, correctness
- Proper authN/authZ (JWT, roles/claims, policies)
- EF Core, ORM data access and validation
- Error handling & tests (happy + failure paths)
- Bonus: performance (caching), async/await, good structure

#### Endpoints
- Auth
  - POST /auth/login with { username, password }
  - Returns { accessToken, expiresAt }
  - Token should include sub, username, and role claims.
- Tasks
  - GET /api/tasks -> list (optionally filter by owner)
  - GET /api/tasks/{id} -> by id
  - POST /api/tasks -> create (owner = current user)
  - PUT /api/tasks/{id} -> update (allow owner only)
  - DELETE /api/tasks/{id} -> Admin only

---

#### Data Scaffold Quick Start

**Models**
```csharp
public class User { public int Id; public string Username = ""; public string PasswordHash = ""; public ICollection<UserRole> UserRoles = []; }
public class Role { public int Id; public string Name = ""; public ICollection<UserRole> UserRoles = []; }
public class UserRole { public int UserId; public User User = null!; public int RoleId; public Role Role = null!; }

public class TaskItem {
  public int Id { get; set; }
  public string Title { get; set; } = "";
  public string? Description { get; set; }
  public bool IsDone { get; set; }
  public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
  public int OwnerUserId { get; set; }
  public User Owner { get; set; } = null!;
}
```

**DB Seed**
```csharp
public class AppDb : DbContext {
  public DbSet<User> Users => Set<User>();
  public DbSet<Role> Roles => Set<Role>();
  public DbSet<UserRole> UserRoles => Set<UserRole>();
  public DbSet<TaskItem> Tasks => Set<TaskItem>();
  public AppDb(DbContextOptions<AppDb> opts) : base(opts) {}

  protected override void OnModelCreating(ModelBuilder b) {
    b.Entity<UserRole>().HasKey(x => new { x.UserId, x.RoleId });

    // Seed roles
    b.Entity<Role>().HasData(
      new Role { Id = 1, Name = "Admin" },
      new Role { Id = 2, Name = "Editor" },
      new Role { Id = 3, Name = "Viewer" }
    );

    // Seed users (password = "Pass@123" in plain for test; candidate can hash)
    b.Entity<User>().HasData(
      new User { Id = 1, Username = "admin", PasswordHash = "Pass@123" },
      new User { Id = 2, Username = "editor", PasswordHash = "Pass@123" },
      new User { Id = 3, Username = "viewer", PasswordHash = "Pass@123" }
    );

    b.Entity<UserRole>().HasData(
      new UserRole { UserId = 1, RoleId = 1 }, // admin -> Admin
      new UserRole { UserId = 2, RoleId = 2 }, // editor -> Editor
      new UserRole { UserId = 3, RoleId = 3 }  // viewer -> Viewer
    );

    b.Entity<TaskItem>().HasData(
      new TaskItem { Id = 1, Title = "Seed Task A", Description = "demo", OwnerUserId = 1 },
      new TaskItem { Id = 2, Title = "Seed Task B", Description = "demo", OwnerUserId = 2 }
    );
  }
}
```

---

#### Stretch Options (Pick any options if time remains)
1. Caching: Cache GET /api/tasks for 10s using IMemoryCache. Invalidate on create/update/delete.
2. Background Job: Add POST /api/tasks/{id}/complete-later to queue a background task that marks IsDone=true after 5 seconds (use BackgroundService).
3. Aggregation: Add GET /api/tasks/with-owners that returns tasks joined with a lightweight DTO of owner info from DB (or simulate external call with Task.Delay).
4. File Upload: POST /api/tasks/import-csv—accepts CSV (Title,Description) and bulk inserts with validation.

---

#### Tech Constraints
- .NET 8 (or 7), ASP.NET Core Web API
- EF Core, Dapper, or Any ORM + SQLite, or SQL Server (or InMemory for speed)
- JWT via Microsoft.AspNetCore.Authentication.JwtBearer
- No need for full layers, but keep structure readable.

Feel free to use the internet to look up any coding references, but please do not use AI or ask anyone else for help. We want to see how you code.