import { Typography } from "../components/Typography";
import styles from "./Home.module.css";

export function Home() {
  return (
    <div className={styles.container}>
      <Typography as="h1">Vivienda en Crisis</Typography>
      <Typography as="p">Hello world</Typography>
    </div>
  );
}
