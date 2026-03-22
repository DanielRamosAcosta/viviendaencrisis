export type UserRole = "user" | "admin";

export interface User {
  id: string;
  email: string;
  displayName: string;
  role: UserRole;
  avatarUrl?: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface CreateUserInput {
  email: string;
  displayName: string;
  role?: UserRole;
  avatarUrl?: string;
}

export interface PublicUser {
  id: string;
  displayName: string;
  role: UserRole;
  avatarUrl?: string;
}
