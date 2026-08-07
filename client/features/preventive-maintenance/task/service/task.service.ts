import { ApiResponse } from "@/types";
import {
  TaskData,
  TaskDataById,
  TaskParams,
  UpdateTaskItemRequest,
} from "../types/task.type";
import api from "@/services/api/api";
import { TASK_ENDPOINT } from "../constant/task.constant";

export const taskService = {
  // Get all tasks
  async getAllTasks(params: TaskParams): Promise<ApiResponse<TaskData[]>> {
    const { data } = await api.get<ApiResponse<TaskData[]>>(
      TASK_ENDPOINT.LIST,
      {
        params,
      },
    );

    return data;
  },

  // Get by id
  async getTaskById(id: number): Promise<ApiResponse<TaskDataById>> {
    const { data } = await api.get<ApiResponse<TaskDataById>>(
      TASK_ENDPOINT.BY_ID(id),
    );

    return data;
  },

  // Update task
  async updateTaskItem(
    id: number,
    itemId: number,
    payload: UpdateTaskItemRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      TASK_ENDPOINT.UPDATE(id, itemId),
      payload,
    );

    return data;
  },

  // Complete task
  async completTaskItem(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      TASK_ENDPOINT.COMPLETE(id),
    );

    return data;
  },
};
