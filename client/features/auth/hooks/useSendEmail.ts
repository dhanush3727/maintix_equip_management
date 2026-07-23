import { useMutation } from "@tanstack/react-query";
import { authService } from "../services/auth.service";

export const useSendEmail = () => {
  return useMutation({
    mutationFn: authService.sendEmailVerification,
  });
};
