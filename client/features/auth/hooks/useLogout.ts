import { useMutation, useQueryClient } from "@tanstack/react-query";
import { authService } from "../services/auth.service";
import { QUERY_KEYS } from "@/constants";

export const useLogout = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: authService.logout,
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.auth.me,
      });
    },
  });
};
