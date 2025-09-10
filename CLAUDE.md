# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Web Application** built as a hybrid full-stack solution combining:
- **Backend**: C# WebAPI 2.0 on .NET Framework 4.8 (not .NET Core)
- **Frontend**: Angular 18 with TypeScript
- **Database**: SQL Server with custom DAL (Data Access Layer)

The project serves as a rapid development template with generic base classes for instant CRUD operations.

## Development Commands

### Angular Frontend (from `/Starter-.NET-4.8-NG-18/AngularFront/`)
```bash
npm run start    # Start development server (ng serve)
npm run build    # Production build (ng build)
npm run test     # Run tests (ng test with Jasmine/Karma)
npm run watch    # Development build with watch mode
```

### Quick Scripts (from root)
```bash
nggo.bat        # Start Angular dev server with auto-open (ng serve -o)
ngb.bat         # Build Angular for production with /dist/ base href
```

### Backend Development
- Use Visual Studio to build and run the C# WebAPI project
- Backend runs on IIS Express (typically port 49476)
- Database connection: SQL Server LocalDB/Express

## Architecture Patterns

### 1. Generic Base Controller Pattern
Inherit from `SimpleController<T>` for instant CRUD APIs:

```csharp
public class ExampleItemController : SimpleController<ExampleItem> { }
```

- Automatic table name inference from type name
- Built-in GET, POST, PUT, DELETE endpoints
- Located in `/Controllers/SimpleController.cs`

### 2. Generic Service Pattern (Angular)
Extend `SimpleService<T>` for HTTP operations with caching:

```typescript
@Injectable({ providedIn: 'root' })
export class ExampleItemService extends SimpleService<ExampleItem> {
  constructor() { super("ExampleItem") }
}
```

- Built-in BehaviorSubject for state management
- Automatic API endpoint construction
- Located in `/src/app/services/simple-service.service.ts`
- When creating new model class artifacts like `ExampleItem` always use pascal case to match the backend

### 3. Custom DAL Pattern
The Data Access Layer (`/App_Data/DAL.cs`) provides:
- Generic methods: `select<T>()`, `insert<T>()`, `update<T>()`, `delete()`
- SQL injection protection and validation
- Machine-specific connection string configuration

### 4. Integrated Deployment
- Backend serves Angular dist files through `/dist/` path
- CORS configured for local development (`http://localhost:4200`)
- 404 errors redirect to Angular for client-side routing

## Configuration

### Database Connection
Connection strings configured in `Web.config`:
```xml
<add key="SqlConnectionString" value="Server=(localdb)\MSSQLLocalDB;Database=BeefMaster;Trusted_Connection=True;" />
```

### Development vs Production
- **Development**: Frontend dev server (port 4200) + Backend (IIS Express)
- **Production**: Angular builds to `/dist/` served by backend
- Caching disabled in development: `<outputCache enableOutputCache="false">`

### Key Configuration Files
- `/Starter-.NET-4.8-NG-18/Web.config` - Backend configuration, connection strings, CORS
- `/Starter-.NET-4.8-NG-18/AngularFront/angular.json` - Angular CLI configuration
- `/Starter-.NET-4.8-NG-18/AngularFront/src/environments/` - Environment-specific settings

## Rapid Development Features

### Creating New Entities
1. Create model class in `/Models/`
2. Create controller: `public class YourEntityController : SimpleController<YourEntity> { }`
3. Create Angular service: `export class YourEntityService extends SimpleService<YourEntity>`
4. Database table will be inferred from class name
5. When creating new model class in angular always use pascal case to match the backend


## Database Requirements

- SQL Server LocalDB or SQL Server Express
- Default connection: `Server=(localdb)\MSSQLLocalDB;Database=BeefMaster;Trusted_Connection=True;`
- Tables are automatically inferred from entity class names
- Primary key convention: `{EntityName}ID` (e.g., `ExampleItemID`)

## Security Features

- Custom SQL injection protection in DAL layer
- Input validation with regex patterns
- CORS configuration for development/production environments
- Custom error handling with optional exception logging