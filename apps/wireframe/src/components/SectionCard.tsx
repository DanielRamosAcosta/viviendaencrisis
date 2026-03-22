import { Link } from "react-router";
import { WiredCard } from "./WiredElements";
import { Typography } from "./Typography";
import styles from "./SectionCard.module.css";

interface SectionCardProps {
  title: string;
  description: string;
  to: string;
}

export function SectionCard({ title, description, to }: SectionCardProps) {
  return (
    <Link to={to} className={styles.link}>
      <WiredCard elevation={2} className={styles.card}>
        <Typography as="h3" className={styles.title}>{title}</Typography>
        <Typography as="p" className={styles.description}>{description}</Typography>
      </WiredCard>
    </Link>
  );
}
