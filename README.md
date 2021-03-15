# StrawHat.Idp.Umbrella

## TODO

- Add support for DID: https://w3c-ccg.github.io/did-primer/

## Session

- **Inactivity Timeout:** Timeframe (in minutes) after which a user's session
  will expire if they haven’t interacted with the Authorization Server. Will be
  superseded by system limits if over 4,320 minutes (3 days) for Developer or
  Developer Pro or 144,000 minutes (100 days) for enterprise plans.
- **Require log in after:** Timeframe (in minutes) after which a user will be
  required to log in again, regardless of their activity. Will be superseded by
  system limits if over 43,200 minutes (30 days) for Developer or Developer Pro
  or 525,600 minutes (365 days) for enterprise plans.

## User statuses

```txt
PROVISIONED - New user is added in but not activated yet
RECOVERY - Existing user, activated previously, is in password reset mode
ACTIVE - Active status
DEPROVISIONED - Deactivated in Okta
PASSWORD EXPIRED - User password is expired
STAGED - New users created through the API and not activated yet
```

### Staged

Accounts become staged when they are first created, before the activation flow is initiated or if there is some administration action pending.

Pending user action	Accounts that are pending user action have been provisioned, but the end user has not provided verification by clicking through the activation email or providing a password.

### Active

Accounts become active when

You add a user (Add Person) in the Manage users page and you set the user password without requiring email verification.
An end user self-registers into your custom app or the Okta Homepage and email verification is not required.
You explicitly activate user accounts.

### Password Reset

Accounts are in a password reset state when

The account requires a password to be set for the first time.
End users request a password reset or you initiate one on their behalf.
Password Reset is considered an Active state.

### Locked out

Accounts become locked out when they exceed the configured number of login attempts which are set when you configure password policies.

Locked out is considered an Active state.

### Suspended

Accounts are in this state when you explicitly suspend them. Application assignments are unaffected.

Suspended is considered an Inactive state.

### Deactivated

Accounts are deactivated when you explicitly deactivate (or deprovision) them. All application assignments are removed.

Deactivated is considered an Inactive state.


```typescript
enum PasswordHashAlgorithm {
  Bcrypt,
  Sha512,
  Sha256,
  Sha1,
  Md5
}

enum PasswordHashOrder {
  Prefix,
  Suffix
}

interface PasswordCredentials {
  value: string;
  algorithm?: PasswordHashAlgorithm;
  work_factor?: number;
  salt?: string
  saltOrder?: PasswordHashOrder;
}

interface UserProfile {
  display_name?: string;
  login: string;
}

interface Credentials {
  password?: PasswordCredentials;
}

enum UserStatus {
  Staged,
  Provisioned,
  Active,
  Deactivated
}

interface UserResponse {
  status: UserStatus
}

interface ActiveWorkflow {
  magic_link?: boolean;
}

interface CreateUserRequest {
  // Executes activation lifecycle operation when creating the user
  activate?: ActiveWorkflow,
  profile: UserProfile,
  credentials?: Credentials
}
```
