import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { taskService } from "../service/task.service";

export const useGetTaskbyId = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.task.id, id],

    queryFn: () => taskService.getTaskById(id),
  });
};
