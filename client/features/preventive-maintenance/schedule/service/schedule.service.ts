import { ApiResponse } from "@/types";
import {
  ScheduleData,
  ScheduleDataById,
  ScheduleParams,
  ScheduleRequest,
} from "../types/schedule.type";
import api from "@/services/api/api";
import { SCHEDULE_ENDPOINTS } from "../constant/schedule.constant";

export const scheduleService = {
  // Create Schedule
  async createSchedule(payload: ScheduleRequest): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      SCHEDULE_ENDPOINTS.CREATE,
      payload,
    );

    return data;
  },

  // Get schedule list
  async getSchedules(
    params: ScheduleParams,
  ): Promise<ApiResponse<ScheduleData>> {
    const { data } = await api.get<ApiResponse<ScheduleData>>(
      SCHEDULE_ENDPOINTS.LIST,
      {
        params,
      },
    );

    return data;
  },

  // Get schedule by id
  async getScheduleById(id: number): Promise<ApiResponse<ScheduleDataById>> {
    const { data } = await api.get<ApiResponse<ScheduleDataById>>(
      SCHEDULE_ENDPOINTS.BY_ID(id),
    );

    return data;
  },

  // Update schedule
  async updateSchedule(
    id: number,
    payload: ScheduleRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      SCHEDULE_ENDPOINTS.UPDATE(id),
      payload,
    );

    return data;
  },

  // Activate schedule
  async activateSchedule(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      SCHEDULE_ENDPOINTS.ACTIVATE(id),
    );

    return data;
  },

  // Deactivate schedule
  async deactivateSchedule(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      SCHEDULE_ENDPOINTS.DEACTIVATE(id),
    );

    return data;
  },
};
