import "wired-elements";
import "wired-elements/lib/wired-calendar.js";

export { WiredButton } from "./WiredButton";
export { WiredCalendar } from "./WiredCalendar";
export { WiredCard } from "./WiredCard";
export { WiredCheckbox } from "./WiredCheckbox";
export { WiredCombo } from "./WiredCombo";
export { WiredDialog } from "./WiredDialog";
export { WiredDivider } from "./WiredDivider";
export { WiredFab } from "./WiredFab";
export { WiredIcon } from "./WiredIcon";
export { WiredImage } from "./WiredImage";
export { WiredInput } from "./WiredInput";
export { WiredLink } from "./WiredLink";
export { WiredListbox } from "./WiredListbox";
export { WiredProgress } from "./WiredProgress";
export { WiredRadio } from "./WiredRadio";
export { WiredSearch } from "./WiredSearch";
export { WiredSlider } from "./WiredSlider";
export { WiredSpinner } from "./WiredSpinner";
export { WiredTabs } from "./WiredTabs";
export { WiredTextarea } from "./WiredTextarea";
export { WiredToggle } from "./WiredToggle";
export { WiredVideo } from "./WiredVideo";

// JSX intrinsic element declarations
declare module "react" {
  // eslint-disable-next-line @typescript-eslint/no-namespace
  namespace JSX {
    interface IntrinsicElements {
      "wired-button": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { elevation?: number | string; disabled?: boolean },
        HTMLElement
      >;
      "wired-calendar": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          selected?: string;
          firstdate?: string;
          lastdate?: string;
          locale?: string;
        },
        HTMLElement
      >;
      "wired-card": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { elevation?: number | string; fill?: string },
        HTMLElement
      >;
      "wired-checkbox": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { checked?: boolean; disabled?: boolean },
        HTMLElement
      >;
      "wired-combo": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { selected?: string },
        HTMLElement
      >;
      "wired-dialog": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { open?: boolean },
        HTMLElement
      >;
      "wired-divider": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { elevation?: number | string },
        HTMLElement
      >;
      "wired-fab": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { disabled?: boolean },
        HTMLElement
      >;
      "wired-icon": React.DetailedHTMLProps<React.HTMLAttributes<HTMLElement>, HTMLElement>;
      "wired-image": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { src?: string; elevation?: number | string },
        HTMLElement
      >;
      "wired-input": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          placeholder?: string;
          value?: string;
          type?: string;
          disabled?: boolean;
        },
        HTMLElement
      >;
      "wired-link": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          href?: string;
          target?: string;
          elevation?: number | string;
        },
        HTMLElement
      >;
      "wired-listbox": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { selected?: string },
        HTMLElement
      >;
      "wired-progress": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          value?: number;
          min?: number;
          max?: number;
          percentage?: boolean;
        },
        HTMLElement
      >;
      "wired-radio": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          checked?: boolean;
          disabled?: boolean;
          name?: string;
          text?: string;
        },
        HTMLElement
      >;
      "wired-search": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          placeholder?: string;
          value?: string;
          disabled?: boolean;
        },
        HTMLElement
      >;
      "wired-slider": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { value?: number; min?: number; max?: number },
        HTMLElement
      >;
      "wired-spinner": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { spinning?: boolean; duration?: number },
        HTMLElement
      >;
      "wired-tabs": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { selected?: string },
        HTMLElement
      >;
      "wired-textarea": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          placeholder?: string;
          value?: string;
          rows?: number;
          disabled?: boolean;
        },
        HTMLElement
      >;
      "wired-toggle": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { checked?: boolean; disabled?: boolean },
        HTMLElement
      >;
      "wired-video": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & {
          src?: string;
          autoplay?: boolean;
          loop?: boolean;
          muted?: boolean;
        },
        HTMLElement
      >;
      "wired-item": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { value?: string; name?: string },
        HTMLElement
      >;
      "wired-tab": React.DetailedHTMLProps<
        React.HTMLAttributes<HTMLElement> & { name?: string },
        HTMLElement
      >;
    }
  }
}
