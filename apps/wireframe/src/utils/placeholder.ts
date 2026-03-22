const BASE_URL = "https://placeholdit.com";
const BG = "dddddd";
const FG = "999999";

export function urlOfImageOfSize(w: number, h: number): string {
  return `${BASE_URL}/${w}x${h}/${BG}/${FG}`;
}
