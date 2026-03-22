import { createContext, useContext, useState, useCallback } from "react";
import type { ReactNode } from "react";

interface User {
  name: string;
  email: string;
}

interface AuthContextValue {
  isLoggedIn: boolean;
  user: User | null;
  login: () => void;
  logout: () => void;
}

const MOCK_USER: User = {
  name: "Demo User",
  email: "demo@example.com",
};

const AuthContext = createContext<AuthContextValue>({
  isLoggedIn: false,
  user: null,
  login: () => {},
  logout: () => {},
});

export function AuthProvider({ children }: { children: ReactNode }) {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const login = useCallback(() => setIsLoggedIn(true), []);
  const logout = useCallback(() => setIsLoggedIn(false), []);

  return (
    <AuthContext.Provider
      value={{
        isLoggedIn,
        user: isLoggedIn ? MOCK_USER : null,
        login,
        logout,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  return useContext(AuthContext);
}
