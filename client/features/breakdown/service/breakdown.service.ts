import { ApiResponse } from "@/types";
import {
  AssignTechnicianRequest,
  BreakdownActionRequest,
  BreakdownData,
  BreakdownDataById,
  BreakdownParams,
  BreakdownRequest,
  ResolveRequest,
} from "../types/breakdown.type";
import api from "@/services/api/api";
import { BREAKDOWN_ENDPOINTS } from "../constants/breakdown.constant";

export const breakdownService = {
  // Create Breakdown
  async createBreakdown(payload: BreakdownRequest): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      BREAKDOWN_ENDPOINTS.CREATE,
      payload,
    );

    return data;
  },

  // Get all breakdowns
  async getBreakdowns(
    params: BreakdownParams,
  ): Promise<ApiResponse<BreakdownData>> {
    const { data } = await api.get<ApiResponse<BreakdownData>>(
      BREAKDOWN_ENDPOINTS.LIST,
      { params },
    );

    return data;
  },

  // Get breakdown by id
  async getBreakdownById(id: number): Promise<ApiResponse<BreakdownDataById>> {
    const { data } = await api.get<ApiResponse<BreakdownDataById>>(
      BREAKDOWN_ENDPOINTS.BY_ID(id),
    );

    return data;
  },

  // Update breakdown
  async updateBreakdown(
    id: number,
    payload: BreakdownRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch(BREAKDOWN_ENDPOINTS.UPDATE(id), payload);

    return data;
  },

  // Assign Technician
  async assignTechnician(
    id: number,
    payload: AssignTechnicianRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch(
      BREAKDOWN_ENDPOINTS.ASSIGN_TECHNICIAN(id),
      payload,
    );

    return data;
  },

  // Create breakdown action
  async createBreakdownAction(
    id: number,
    payload: BreakdownActionRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.post(
      BREAKDOWN_ENDPOINTS.CREATE_ACTIONS(id),
      payload,
    );

    return data;
  },

  // Update breakdown action
  async updateBreakdownAction(
    id: number,
    actionId: number,
    payload: BreakdownActionRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch(
      BREAKDOWN_ENDPOINTS.UPDATE_ACTIONS(id, actionId),
      payload,
    );

    return data;
  },

  // Delete breakdown action
  async deleteBreakdownAction(
    id: number,
    actionId: number,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.delete(
      BREAKDOWN_ENDPOINTS.DELETE_ACTIONS(id, actionId),
    );

    return data;
  },

  // Resolve breakdown
  async resolveBreakdown(
    id: number,
    payload: ResolveRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch(BREAKDOWN_ENDPOINTS.RESOLVE(id), payload);

    return data;
  },

  // Close breakdown
  async closeBreakdown(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch(BREAKDOWN_ENDPOINTS.CLOSE(id));

    return data;
  },
};
