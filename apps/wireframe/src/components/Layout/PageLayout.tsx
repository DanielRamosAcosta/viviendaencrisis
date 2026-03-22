import type { ReactNode } from "react";
import { Navbar } from "./Navbar";
import { Footer } from "./Footer";
import styles from "./PageLayout.module.css";

export function PageLayout({ children }: { children: ReactNode }) {
  return (
    <div className={styles.layout}>
      <Navbar />
      <main className={styles.page}>{children}</main>
      <Footer />
    </div>
  );
}
