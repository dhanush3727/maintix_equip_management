import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { dashboardService } from "../services/dashboard.service";

export const useGetDashboard = () => {
  return useQuery({
    queryKey: QUERY_KEYS.dashboard.get_dashboard,
    queryFn: dashboardService.getDashboard,
  });
};
