import { Typography } from "./Typography";
import styles from "./StarRating.module.css";

interface StarRatingProps {
  value: number;
  onChange?: (value: number) => void;
  readOnly?: boolean;
}

export function StarRating({ value, onChange, readOnly = false }: StarRatingProps) {
  return (
    <div className={styles.container}>
      {[1, 2, 3, 4, 5].map((star) => (
        <Typography
          as="span"
          key={star}
          className={`${styles.star} ${star <= value ? styles.filled : styles.empty} ${!readOnly ? styles.clickable : ""}`}
          onClick={() => !readOnly && onChange?.(star)}
        >
          {star <= value ? "\u2605" : "\u2606"}
        </Typography>
      ))}
    </div>
  );
}
