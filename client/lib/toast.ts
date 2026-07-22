import { toast } from "sonner";

export const appToast = {
  success: (message: string) =>
    toast.success(message, {
      style: {
        background: "#eaf8f0",
        color: "#23864f",
      },
    }),

  error: (message: string) =>
    toast.error(message, {
      style: {
        background: "#fdeeee",
        color: "#d84a3a",
      },
    }),

  warning: (message: string) =>
    toast.warning(message, {
      style: {
        background: "#fff8e6",
        color: "#d8a30e",
      },
    }),

  info: (message: string) =>
    toast.info(message, {
      style: {
        background: "#eef4ff",
        color: "#4d87f5",
      },
    }),
};
