import { useState } from "react";
import { Link, useLocation } from "react-router";
import { Typography } from "../Typography";
import { WiredButton, WiredFab } from "../WiredElements";
import { useAuth } from "../../context/AuthContext";
import styles from "./Navbar.module.css";

const NAV_ITEMS = [
  { label: "Precios", path: "/precios" },
  { label: "Reportes", path: "/reportes" },
  { label: "Datos", path: "/datos" },
  { label: "Mi cuenta", path: "/cuenta", auth: true },
  { label: "Info", path: "/info" },
];

export function Navbar() {
  const [menuOpen, setMenuOpen] = useState(false);
  const location = useLocation();
  const { isLoggedIn, logout } = useAuth();

  const isActive = (path: string) => location.pathname.startsWith(path);

  return (
    <nav className={styles.navbar}>
      <div className={styles.navContent}>
        <Link to="/" className={styles.logo}>
          <Typography as="h1" className={styles.logoText}>
            Vivienda en Crisis
          </Typography>
        </Link>

        <div className={styles.hamburger}>
          <WiredFab onClick={() => setMenuOpen(!menuOpen)} />
        </div>

        <div className={`${styles.navLinks} ${menuOpen ? styles.navLinksOpen : ""}`}>
          {NAV_ITEMS.map((item) => {
            if (item.auth && !isLoggedIn) return null;
            return (
              <Link
                key={item.path}
                to={item.path}
                className={`${styles.navLink} ${isActive(item.path) ? styles.navLinkActive : ""}`}
                onClick={() => setMenuOpen(false)}
              >
                <Typography as="span">{item.label}</Typography>
              </Link>
            );
          })}

          <div className={styles.authSection}>
            {isLoggedIn ? (
              <WiredButton onClick={logout}>Cerrar sesion</WiredButton>
            ) : (
              <Link to="/login" onClick={() => setMenuOpen(false)}>
                <WiredButton>Iniciar sesion</WiredButton>
              </Link>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}
